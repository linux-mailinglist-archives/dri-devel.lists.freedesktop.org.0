Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E59CDB6313
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 14:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CAE6EF1A;
	Wed, 18 Sep 2019 12:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9CD8E6EF1B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 12:24:52 +0000 (UTC)
X-UUID: 59645334a68a4975b2b58da627dd2dd1-20190918
X-UUID: 59645334a68a4975b2b58da627dd2dd1-20190918
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 621727428; Wed, 18 Sep 2019 20:24:46 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 18 Sep 2019 20:24:45 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 18 Sep 2019 20:24:44 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 5/8] dt-bindings: display: panel: add boe tv101wum-n53
 panel documentation
Date: Wed, 18 Sep 2019 20:24:19 +0800
Message-ID: <20190918122422.17339-6-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918122422.17339-1-jitao.shi@mediatek.com>
References: <20190918122422.17339-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 430FBC60B687FA97652A78F6C27BAEAD38D10875E6A632C0893FDB0AF2B4ECFA2000:8
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

QWRkIGRjdW1lbnRhdGlvbiBmb3IgYm9lLHR2MTAxd3VtLW41Mywgd2hpY2ggaXMgbWlwaSBkc2kg
dmlkZW8gcGFuZWwKYW5kIHJlc29sdXRpb24gaXMgMTIwMHgxOTIwLgoKU2lnbmVkLW9mZi1ieTog
Sml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgotLS0KIC4uLi9kaXNwbGF5L3BhbmVs
L2JvZSx0djEwMXd1bS1uNTMueWFtbCAgICAgICB8IDY3ICsrKysrKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYm9lLHR2MTAxd3VtLW41
My55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvYm9lLHR2MTAxd3VtLW41My55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYm9lLHR2MTAxd3VtLW41My55YW1sCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZjU0MTQ0NmZjNzBjCi0tLSAvZGV2L251
bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
Ym9lLHR2MTAxd3VtLW41My55YW1sCkBAIC0wLDAgKzEsNjcgQEAKKyMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9zY2hlbWFzL2Rpc3BsYXkvcGFuZWwvYm9lLHR2MTAxd3VtLW41My55YW1sIworJHNjaGVt
YTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxl
OiBCT0UgVFYxMDFXVU0tTjUzIERTSSBEaXNwbGF5IFBhbmVsCisKK21haW50YWluZXJzOgorICAt
IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CisgIC0gU2FtIFJhdm5i
b3JnIDxzYW1AcmF2bmJvcmcub3JnPgorICAtIFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5v
cmc+CisgCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgICAgICBjb25zdDogYm9lLHR2
MTAxd3VtLW41MworCisgIHJlZzoKKyAgICBkZXNjcmlwdGlvbjogdGhlIHZpcnR1YWwgY2hhbm5l
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
ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJib2UsdHYxMDF3dW0tbjUzIjsKKyAgICAgICAgICAg
IHJlZyA9IDwwPjsKKyAgICAgICAgICAgIGVuYWJsZS1ncGlvcyA9IDwmcGlvIDQ1IDA+OworICAg
ICAgICAgICAgYXZkZC1zdXBwbHkgPSA8JnBwdmFybl9sY2Q+OworICAgICAgICAgICAgYXZlZS1z
dXBwbHkgPSA8JnBwdmFycF9sY2Q+OworICAgICAgICAgICAgcHAxODAwLXN1cHBseSA9IDwmcHAx
ODAwX2xjZD47CisgICAgICAgICAgICBiYWNrbGlnaHQgPSA8JmJhY2tsaWdodF9sY2QwPjsKKyAg
ICAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsKKyAgICAgICAgICAgIHBvcnQgeworICAgICAgICAg
ICAgICAgIHBhbmVsX2luOiBlbmRwb2ludCB7CisgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1l
bmRwb2ludCA9IDwmZHNpX291dD47CisgICAgICAgICAgICAgICAgfTsKKyAgICAgICAgICAgIH07
CisgICAgICAgIH07CisgICAgfTsKKworLi4uClwgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZQot
LSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
