import java.util.*;

public class Main {
    public static void main(String[] args) {
        /*
        List<Integer> arrList=new ArrayList<>();

        //add - pazi insertion order
        arrList.add(1); //dobavq nakraq
        arrList.add(2);
        arrList.add(-1);
        arrList.add(0,5); //dobavq na indeks

        //update
        arrList.set(0,6);//promenq el po indeks
        System.out.println(arrList);
        //delete
        arrList.remove(1); //maha po indeks
        arrList.remove(Integer.valueOf(6)); //maha elementa

        //read
        //kogato samo cetem a ne promenqme e po db - enhanced for; for
        System.out.println("sout s get(index): "+arrList.get(0));
        System.out.println("sout na celiq list"+arrList);

        System.out.print("sout s enhanced list: ");
        for(int l:arrList)
        {
            System.out.print(l+ " ");
        }
        System.out.println("s norm masiv: ");

        for(int i=0;i<arrList.size();i++) {
            System.out.print(arrList.get(i)+" ");
        }

        //ne moje da triesh ili dobavqsh samo obhojdash; raboti sas streams; moje da pishem lambda
        arrList.forEach(s -> System.out.println(s));

        //kolko el ima v arrlist
        System.out.println("size: "+arrList.size());
        //iztrivane na cqlata kolekciq
        arrList.clear();

        List<Integer> arrList2=new ArrayList<>(){
            {
                add(1);
                add(2);
                add(3);
                add(4);
            }
        };
        //obhojdane i promqna s iterator
        /*
        * ArrayList поддържа modCount – брояч на модификации на списъка (добавяне/премахване).
          Всеки Iterator проверява modCount при next():Когато премахнеш директно чрез list.remove(x), modCount се увеличава.
          it.remove() не създава нова колекция, а директно модифицира оригиналния масив в ArrayList.*/
      /*  Iterator<Integer> it = arrList2.iterator();
        while (it.hasNext()) {
            Integer x = it.next();
            if (x % 2 == 0) it.remove(); //!
        }

        System.out.println(arrList2);

        ArrayList<Integer> arrList3=new ArrayList<>(){
            {add(1);add(2);add(3);add(4);add(5);}
        };

        //removeif-samo za triene ako ne ni trqbva dr operacii
        arrList3.removeIf(x -> x % 2 == 0);
        System.out.println("arr3 "+ arrList3);
        */

        /*
        //linked list
        List<Integer> ll=new LinkedList<>(){
            {add(1);
                add(2);
                add(3);
                add(4);
                add(5);}
        };

        ll.add(6); //nai otzade dobavq
        System.out.println(ll);

        ll.add(1,7);//dobavq na indeks
        System.out.println(ll);

        ll.remove(2); //maha indeks
        System.out.println(ll);

        ll.remove(Integer.valueOf(3));//maha stoinost
        System.out.println(ll);

        System.out.println(ll.get(1));
        */

        /*
        //hashset
        Set<Integer> hset = new HashSet<>(){{
            add(1);
            add(2);
            add(3);
            add(4);
            add(5);
        }};
        for(Integer i : hset) {
            System.out.print(i+" ");
        }
        //nqmame get v set zashtoto nqma indeks dori v linked
        Iterator<Integer> it = hset.iterator();
        while(it.hasNext()) {
            Integer i = it.next();
            if(i%2==0){
               it.remove();
            }
        }
        System.out.println(hset);
        */

        //hashmap
        Map<Integer,String> map1 = new HashMap<>(){{
            put(1,"A");
            put(2,"B");
            put(3,"C");
            put(4,"D");
        }};

        map1.remove(1);//maha po kluc
        System.out.println(map1);

        System.out.println(map1.get(2));//vrashta value po key

        //enhanced for
        for(Map.Entry<Integer,String> e : map1.entrySet()){
            System.out.println(e.getKey()+" "+e.getValue());
        }
        //forEach method
        map1.forEach((k,v)->System.out.println(k+" "+v));

        for(Integer i : map1.keySet()){
            System.out.println(i+" "+map1.get(i));
        }

        for(String v: map1.values()){
            System.out.println(v);
        }

        //premahvane pri iteraciq
        Iterator<Map.Entry<Integer, String>> it = map1.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<Integer, String> entry = it.next();
            if (entry.getKey() % 2 == 0) {
                it.remove();
            }
        }
        System.out.println("---------");
        map1.entrySet().removeIf(entry -> entry.getValue().startsWith("B"));
        System.out.println(map1);

    }
}