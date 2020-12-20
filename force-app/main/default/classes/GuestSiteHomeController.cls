public without sharing class GuestSiteHomeController {

    public String contactName {get;set;}
    private Contact cont;

    public GuestSiteHomeController() {
        List<Contact> cons = new List<Contact>([
            SELECT LastName, Id
            FROM Contact
            LIMIT 1
        ]);
        if(cons.isEmpty()) {
            contactName = 'None';
        } else {
            contactName = cons[0].LastName;
            cont = cons[0];
        }
    }

    public void updateContact() {
        if(cont != null) {
            GuestSiteHomeService conSelector = new GuestSiteHomeService();
            conSelector.updateContact(cont);
        }
    }
}