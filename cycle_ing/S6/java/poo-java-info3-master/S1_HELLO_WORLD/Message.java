public class Message {

    French message;

    public Message() {
        this.message = new French();
    }

    public void print(){
        System.out.println(message.hello());
    }

}
