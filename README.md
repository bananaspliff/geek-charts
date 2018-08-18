## Welcome to Bananaspliff Helm Catalog

- helm repo add bananaspliff https://bananaspliff.github.io/geek-charts

- do not forget to add myvolume :)


helmfile sample :

    repositories:
      - name: bananaspliff
        url: https://bananaspliff.github.io/geek-charts

    releases:
      - name: xavier-emby
        namespace: xavier
        chart: bananaspliff/emby
        version: 0.1.0
        values:
             - image:
                 tag: 3.6.0.2
             - ingress:
                enabled: true
                hosts:
                  - emby.bananaspliff.org
                tls:
                  - hosts:
                      - emby.bananaspliff.org
                    secretName: emby-bananaspliff.org

      - name: xavier-sftp
        namespace: xavier
        chart: bananaspliff/sftp
        version: 0.1.0
        values:
            - image:
                tag: latest
                args: "foo:password:1000"
            - volumeMounts:
              - name: myvolume
                mountPath: "/home/foo"
