
def getMavenAgent(){
    """
metadata:
  labels:
    agent: ci-cambpm-camunda-cloud-build
spec:
  nodeSelector:
    cloud.google.com/gke-nodepool: agents-n1-standard-4-netssd-preempt
  tolerations:
  - key: "agents-n1-standard-4-netssd-preempt"
    operator: "Exists"
    effect: "NoSchedule"
  containers:
  - name: maven
    image: maven:3.6.3-openjdk-8
    command: ["cat"]
    tty: true
    env:
    - name: TZ
      value: Europe/Berlin
    resources:
      limits:
        cpu: 3
        memory: 8Gi
      requests:
        cpu: 3
        memory: 8Gi
    """
}

pipeline{
  agent none
  stages{
    stage("First stage"){
      agent {
        kubernetes {
          yaml getMavenAgent()
        }
      }
      steps{
        container("maven"){
          git credentialsId: 'camunda-jenkins-github-ssh',
              url: 'git@github.com:camunda/camunda-bpm-webapp.git'
          sh("pwd")
          configFileProvider([configFile(fileId: 'maven-nexus-settings', variable: 'MAVEN_SETTINGS_XML')]) {
            sh("cd camunda-bpm-webapp && mvn -s \$MAVEN_SETTINGS_XML -B -T3 clean install -D skipTests && cd ..")
          }
          configFileProvider([configFile(fileId: 'maven-nexus-settings', variable: 'MAVEN_SETTINGS_XML')]) {
            sh("mvn -s \$MAVEN_SETTINGS_XML -B -T3 clean install -D skipTests")
          }
        }
      }
    }
  }
}