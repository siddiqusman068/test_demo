package com.ublircs.util;

import com.ublircs.model.Options;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by Usman Siddiq on 3/5/2019.
 */
public class CustomList {

    public static List<Options> populateInsdustrySpecificList() {
        List<Options> industrySpecific = new ArrayList<Options>();

        industrySpecific.add(new Options("Specific Information for Textile/Garment Factory/Spinning Mills/Weaving Mills", "Specific Information for Textile/Garment Factory/Spinning Mills/Weaving Mills"));
        industrySpecific.add(new Options("Specific Information for Cotton Factory/Cotton Ginning/Pressing Factory", "Specific Information for Cotton Factory/Cotton Ginning/Pressing Factory"));
        industrySpecific.add(new Options("Specific Information for Oil & Feed Mills", "Specific Information for Oil & Feed Mills"));
        industrySpecific.add(new Options("Specific Information for Cosmetics/Chemical Factories/Labs", "Specific Information for Cosmetics/Chemical Factories/Labs"));
        industrySpecific.add(new Options("Specific Information for Livestock, Farms", "Specific Information for Livestock, Farms"));
        industrySpecific.add(new Options("Specific Information for Paper or Board Mills", "Specific Information for Paper or Board Mills"));

        return industrySpecific;
    }

    public static List<Options> populateCities() {
        List<Options> cities = new ArrayList<Options>();
        String[] citiesArr = {"Badin", "Bhirkan", "Bhiria City", "Bhiria Road", "Rajo Khanani", "Buner", "Chak", "Dadu", "Digri", "Diplo", "Dokri", "Ghotki", "Haala", "Hyderabad", "Islamkot", "Jacobabad", "Jamshoro", "Jungshahi", "Kandhkot", "Kandiaro", "Karachi", "Kashmore", "Keti Bandar", "Khadro", "Kotri", "Larkana", "Matiari", "Mehar", "Mirpur Khas",
                "Mithani", "Mehrabpur", "Moro", "Nagarparkar", "Naudero", "Naushahro Feroze", "Naushara", "Nawabshah", "Qambar", "Qasimabad", "Ranipur", "Ratodero", "Rohri", "Sakrand", "Sanghar", "Shahbandar", "Shahdadkot", "Shahdadpur", "Shahpur Chakar", "Shikarpaur", "Sukkur", "Tangwani", "Tando Adam Khan", "Tando Allahyar",
                "Tando Muhammad Khan", "Thatta", "Thari Mirwah", "Umerkot", "Ahmadpur East", "Ahmed Nager Chatha", "Ali Khan Abad", "Alipur", "Arifwala", "Attock", "Bhera", "Bhalwal", "Bahawalnagar", "Bahawalpur", "Bhakkar", "Burewala", "Chillianwala", "Chakwal", "Chak Jhumra", "Chichawatni", "Chiniot", "Chishtian", "Chunian",
                "Dajkot", "Daska", "Davispur", "Darya Khan", "Dera Ghazi Khan", "Dhaular", "Dina", "Dinga", "Dipalpur", "Faisalabad", "Fateh Jang", "Ghakhar Mandi", "Gojra", "Gujranwala", "Gujrat", "Gujar Khan", "Harappa", "Hafizabad", "Haroonabad", "Hasilpur", "Haveli Lakha", "Jalalpur Jattan", "Jampur", "Jaranwala", "Jhang",
                "Jhelum", "Kalabagh", "Karor Lal Esan", "Kasur", "Kamalia", "Kāmoke", "Khanewal", "Khanpur", "Khanqah Sharif", "Kharian", "Khushab", "Kot Adu", "Jauharabad", "Lahore", "Islamabad", "Lalamusa 1 2", "Layyah", "Liaquat Pur", "Lodhran", "Malakwal", "Malakand", "Mamoori", "Mailsi", "Mandi Bahauddin", "Mandi Burewala", "Mian Channu", "Mianwali",
                "Miani", "Multan", "Murree", "Muridke", "Mianwali Bangla", "Muzaffargarh", "Narowal", "Nankana Sahib", "Okara", "Renala Khurd", "Pakpattan", "Pattoki", "Pindi Bhattian", "Pind Dadan Khan", "Pir Mahal", "Qaimpur", "Qila Didar Singh", "Rabwah", "Raiwind", "Rajanpur", "Rahim Yar Khan", "Rawalpindi", "Sadiqabad",
                "Safdarabad", "Sahiwal", "Sambrial", "Samundri", "Sangla Hill", "Sarai Alamgir", "Sargodha", "Shakargarh", "Sheikhupura", "Shujaabad", "Sialkot", "Sohawa", "Soianwala", "Siranwali", "Tandlianwala", "Talagang", "Taxila", "Toba Tek Singh", "Vehari", "Wah Cantonment", "Wazirabad", "Yazman", "Zafarwal", "Abbottabad",
                "Adezai", "Alpuri", "Akora Khattak", "Ayubia", "Banda Daud Shah", "Bannu", "Batkhela", "Battagram", "Birote", "Chakdara", "Charsadda", "Cherat", "Chitral", "Daggar", "Dargai", "Dera Ismail Khan", "Doaba", "Lower Dir", "Upper Dir", "Drosh", "Hangu", "Haripur", "Karak", "Kohat", "Kulachi", "Lakki Marwat", "Latamber", "Madyan", "Mansehra",
                "Mardan", "Mastuj", "Mingora", "Naran, Kaghan Valley", "Nowshera", "Paharpur", "Pabbi", "Peshawar", "Risalpur", "Saidu Sharif", "Shewa Adda", "Swabi", "Swat", "Tangi", "Tank", "Thall", "Timergara", "Tordher", "Quetta", "Khuzdar", "Turbat", "Chaman", "Hub", "Sibi", "Zhob", "Gwadar", "Dera Murad Jamali", "Dera Allah Yar",
                "Usta Mohammad", "Cherat", "Loralai", "Pasni", "Kharan", "Mastung", "Nushki", "Kalat", "Askole", "Astore", "Bunji (or Boanzhi)", "Chilas", "Chillinji", "Chiran", "Gakuch", "Ghangche", "Ghizer", "Gilgit", "Dayore - Gilgit", "Sultanabad - Gilgit", "Oshikhanda Gilgit", "Jalalabad Gilgit", "Jutial Gilgit", "Alyabad Hunza", "Shangla",
                "Gorikot", "Gulmit", "Jaglot", "Chalt (Nagar)", "Thole (Nagar)", "Nasir Abad", "Mayoon", "Khana Abad", "Hussain Abad", "Qasimabad Masoot (Nagar)", "Nagar Proper", "Ghulmat (Nagar)", "Karimabad (Hunza)", "Ishkoman", "Khaplu", "Minimerg", "Misgar", "Passu", "Shimshal", "Skardu", "Sust", "Taghafari", "Thorar", "Muzaffarabad", "Neelam", "Poonch",
                "Mirpur", "Bhimber", "Kotli", "Rawlakot", "Bagh", "Jatlan", "Sudhanoti", "Kohlu", "Bolan", "Khairpur", "Tharparkar"
        };
        //cities.add(new Options("", "Select a City"));
        Arrays.sort(citiesArr);

        for (int i = 0; i <= citiesArr.length - 1; i++) {
            cities.add(new Options(citiesArr[i], citiesArr[i]));
        }

        return cities;
    }

}
