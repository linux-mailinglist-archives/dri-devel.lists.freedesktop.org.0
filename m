Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51145D4C49
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2019 05:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53AA6ECA7;
	Sat, 12 Oct 2019 03:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 638C36E5C8
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 03:07:52 +0000 (UTC)
X-UUID: 1546340fb04a4756af28f25751b60902-20191012
X-UUID: 1546340fb04a4756af28f25751b60902-20191012
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 805684718; Sat, 12 Oct 2019 11:07:45 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sat, 12 Oct 2019 11:07:42 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sat, 12 Oct 2019 11:07:41 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 3/8] dt-bindings: display: panel: add auo kd101n80-45na
 panel bindings
Date: Sat, 12 Oct 2019 11:07:15 +0800
Message-ID: <20191012030720.27127-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191012030720.27127-1-jitao.shi@mediatek.com>
References: <20191012030720.27127-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B1703BEAAF6946DE1CA55BF37AA78AB710073CC6D9653C91AAC35A86A128B1CD2000:8
X-MTK: N
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 stonea168@163.com, cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRvY3VtZW50YXRpb24gZm9yIGF1byBrZDEwMW44MC00NW5hIHBhbmVsLgoKU2lnbmVkLW9m
Zi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgpSZXZpZXdlZC1ieTogU2Ft
IFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgotLS0KIC4uLi9kaXNwbGF5L3BhbmVsL2F1byxr
ZDEwMW44MC00NW5hLnlhbWwgICAgICB8IDY3ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXVvLGtkMTAxbjgwLTQ1bmEueWFt
bAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3BhbmVsL2F1byxrZDEwMW44MC00NW5hLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9wYW5lbC9hdW8sa2QxMDFuODAtNDVuYS55YW1sCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uNDZiYTdlOGEzODk2Ci0tLSAvZGV2L251bGwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXVv
LGtkMTAxbjgwLTQ1bmEueWFtbApAQCAtMCwwICsxLDY3IEBACisjIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL2F1byxrZDEwMW44MC00NW5hLnlhbWwjCiskc2NoZW1h
OiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6
IEFVTyBLRDEwMU44MC00NU5BIERTSSBEaXNwbGF5IFBhbmVsCisKK21haW50YWluZXJzOgorICAt
IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CisgIC0gU2FtIFJhdm5i
b3JnIDxzYW1AcmF2bmJvcmcub3JnPgorICAtIFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5v
cmc+CisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgICAgIGNvbnN0OiBhdW8sa2Qx
MDFuODAtNDVuYQorCisgIHJlZzoKKyAgICBkZXNjcmlwdGlvbjogdGhlIHZpcnR1YWwgY2hhbm5l
bCBudW1iZXIgb2YgYSBEU0kgcGVyaXBoZXJhbAorCisgIGVuYWJsZS1ncGlvczoKKyAgICBkZXNj
cmlwdGlvbjogYSBHUElPIHNwZWMgZm9yIHRoZSBlbmFibGUgcGluCisKKyAgcHAxODAwLXN1cHBs
eToKKyAgICBkZXNjcmlwdGlvbjogY29yZSB2b2x0YWdlIHN1cHBseQorCisgIGF2ZGQtc3VwcGx5
OgorICAgIGRlc2NyaXB0aW9uOiBwaGFuZGxlIG9mIHRoZSByZWd1bGF0b3IgdGhhdCBwcm92aWRl
cyBwb3NpdGl2ZSB2b2x0YWdlCisKKyAgYXZlZS1zdXBwbHk6CisgICAgZGVzY3JpcHRpb246IHBo
YW5kbGUgb2YgdGhlIHJlZ3VsYXRvciB0aGF0IHByb3ZpZGVzIG5lZ2F0aXZlIHZvbHRhZ2UKKwor
ICBiYWNrbGlnaHQ6CisgICAgZGVzY3JpcHRpb246IHBoYW5kbGUgb2YgdGhlIGJhY2tsaWdodCBk
ZXZpY2UgYXR0YWNoZWQgdG8gdGhlIHBhbmVsCisKK3JlcXVpcmVkOgorIC0gY29tcGF0aWJsZQor
IC0gcmVnCisgLSBlbmFibGUtZ3Bpb3MKKyAtIHBwMTgwMC1zdXBwbHkKKyAtIGF2ZGQtc3VwcGx5
CisgLSBhdmVlLXN1cHBseQorIC0gYmFja2xpZ2h0CisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBm
YWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgJmRzaSB7CisgICAgICAgIHBhbmVsQDAgewor
ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhdW8sa2QxMDFuODAtNDVuYSI7CisgICAgICAgICAg
ICByZWcgPSA8MD47CisgICAgICAgICAgICBlbmFibGUtZ3Bpb3MgPSA8JnBpbyA0NSAwPjsKKyAg
ICAgICAgICAgIGF2ZGQtc3VwcGx5ID0gPCZwcHZhcm5fbGNkPjsKKyAgICAgICAgICAgIGF2ZWUt
c3VwcGx5ID0gPCZwcHZhcnBfbGNkPjsKKyAgICAgICAgICAgIHBwMTgwMC1zdXBwbHkgPSA8JnBw
MTgwMF9sY2Q+OworICAgICAgICAgICAgYmFja2xpZ2h0ID0gPCZiYWNrbGlnaHRfbGNkMD47Cisg
ICAgICAgICAgICBzdGF0dXMgPSAib2theSI7CisgICAgICAgICAgICBwb3J0IHsKKyAgICAgICAg
ICAgICAgICBwYW5lbF9pbjogZW5kcG9pbnQgeworICAgICAgICAgICAgICAgICAgICByZW1vdGUt
ZW5kcG9pbnQgPSA8JmRzaV9vdXQ+OworICAgICAgICAgICAgICAgIH07CisgICAgICAgICAgICB9
OworICAgICAgICB9OworICAgIH07CisKKy4uLgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
