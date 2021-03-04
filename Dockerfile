FROM node:latest

ENV APP_ROOT /home/app

ENV JWT_SECRET vHVP/engBteZ2ivop3kZhrOHD/NFtez2EOI/Ad9aMYM=

ENV APP_URL http://localhost:3000/
# ENV API_URL http://localhost:3000/api/
ENV API_URL_PROXY http://localhost:8080/eft/rest

# ENV WIRED_ENV dev

EXPOSE 3000 9229
COPY . /home/app
WORKDIR /home/app
# RUN npm update

RUN npm -v
RUN node --version
# RUN npm install material-design-icons-3.0.1.tgz
# RUN rm -rf node_modules/

#RUN npm install --save core-js/modules/es.array.concat core-js/modules/es.array.every core-js/modules/es.array.fill core-js/modules/es.array.filter core-js/modules/es.array.find core-js/modules/es.array.find-index core-js/modules/es.array.flat core-js/modules/es.array.for-each core-js/modules/es.array.from core-js/modules/es.array.includes core-js/modules/es.array.index-of core-js/modules/es.array.join core-js/modules/es.array.map core-js/modules/es.array.reduce core-js/modules/es.array.reverse core-js/modules/es.array.slice core-js/modules/es.array.some core-js/modules/es.array.sort core-js/modules/es.array.splice core-js/modules/es.array.unscopables.flat core-js/modules/es.date.to-string core-js/modules/es.function.name core-js/modules/es.map core-js/modules/es.math.cbrt core-js/modules/es.math.sign core-js/modules/es.number.constructor core-js/modules/es.number.max-safe-integer core-js/modules/es.number.to-fixed core-js/modules/es.object.freeze core-js/modules/es.object.get-own-property-descriptor core-js/modules/es.object.get-own-property-descriptors core-js/modules/es.object.keys core-js/modules/es.object.to-string core-js/modules/es.object.values core-js/modules/es.parse-float core-js/modules/es.parse-int core-js/modules/es.regexp.exec core-js/modules/es.regexp.to-string core-js/modules/es.set core-js/modules/es.string.anchor core-js/modules/es.string.ends-with core-js/modules/es.string.fixed core-js/modules/es.string.includes core-js/modules/es.string.iterator core-js/modules/es.string.link core-js/modules/es.string.match core-js/modules/es.string.pad-start core-js/modules/es.string.repeat core-js/modules/es.string.replace core-js/modules/es.string.search core-js/modules/es.string.small core-js/modules/es.string.split core-js/modules/es.string.starts-with core-js/modules/es.string.sub core-js/modules/es.string.trim core-js/modules/es.symbol core-js/modules/es.symbol.description core-js/modules/es.symbol.iterator core-js/modules/web.dom-collections.for-each core-js/modules/web.dom-collections.iterator

# RUN npm install core-js@^3

RUN npm install --force

RUN npm run build

CMD [ "npm", "start" ]

ENV HOST 0.0.0.0
