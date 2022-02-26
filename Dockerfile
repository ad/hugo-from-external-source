FROM klakegg/hugo:0.92.2-ext-alpine as build
WORKDIR /site
COPY /prebuild /site
RUN hugo
RUN ls -la /site/public/posts

FROM klakegg/hugo:0.92.2-ext-alpine as run
WORKDIR /site
COPY . /site
COPY --from=build /site/public/posts /site/content/posts
RUN ls -la /site/content/posts
ENTRYPOINT ["hugo", "server"]
