FROM golang:rc-alpine AS build

WORKDIR /opt/fullcycle

COPY . /opt/fullcycle

RUN cd /opt/fullcycle && go build helloword.go


FROM scratch

COPY --from=build /opt/fullcycle/helloword .

CMD [ "./helloword" ]

