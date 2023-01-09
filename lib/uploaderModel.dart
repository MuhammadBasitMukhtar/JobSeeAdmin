class Uploader {
  String name;
  String title;
  String company;
  String jobid;
  int timeStamp;

  Uploader(this.name, this.title, this.company, this.jobid, this.timeStamp);

  String getName() {
    return this.name;
  }

  String getTitle() {
    return this.title;
  }
}
