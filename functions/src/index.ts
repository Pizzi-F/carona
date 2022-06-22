import * as functions from "firebase-functions";
import { Client } from "@notionhq/client";

// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//

const notion = new Client({ auth: "secret_OcB89rTELWYJZAAhaQODXaeviNW9vfPxcNYUc6foaxT" });
const databaseId = "3b07c68e53814158b304657fb9cbc422";

export const enviarEmail = functions.auth.user().onCreate(
    async user => {
        const userEmail: any = user.email;

        try {
            await notion.pages.create(<any>{
                parent: { database_id: databaseId },
                properties: {
                    Email: {
                        title: [{ type: "text", text: { content: userEmail } }],
                    },
                    Etapa: {
                        multi_select: [{ name: "Novo Cadastro" }]
                    }
                }
            })
            console.log('Sincronizado');
        } catch (error) {
            console.log({auth: functions.config().notion.key});
        }
        return true;
    }
)