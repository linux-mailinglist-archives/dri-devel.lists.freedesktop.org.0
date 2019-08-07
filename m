Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2208444A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 08:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BC06E612;
	Wed,  7 Aug 2019 06:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 438C96E60C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 06:08:15 +0000 (UTC)
X-UUID: 9a2df9b7262d4750a79ae726566ef34a-20190807
X-UUID: 9a2df9b7262d4750a79ae726566ef34a-20190807
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1505431920; Wed, 07 Aug 2019 14:03:08 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 7 Aug 2019 14:03:04 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 7 Aug 2019 14:03:02 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, 
 <linux-pwm@vger.kernel.org>, David Airlie <airlied@linux.ie>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5 1/4] dt-bindings: display: mediatek: update dpi supported
 chips
Date: Wed, 7 Aug 2019 14:02:54 +0800
Message-ID: <20190807060257.57007-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190807060257.57007-1-jitao.shi@mediatek.com>
References: <20190807060257.57007-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C69E228641317CEF5F977F938A43637FA6695ED07D1225B291DE2BC80CE66BAA2000:8
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
Cc: stonea168@163.com, dri-devel@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>, Ajay Kumar <ajaykumar.rs@samsung.com>,
 Vincent Palatin <vpalatin@chromium.org>, cawa.cheng@mediatek.com,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org,
 Jitao Shi <jitao.shi@mediatek.com>, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRlY3JpcHRpb25zIGFib3V0IHN1cHBvcnRlZCBjaGlwcywgaW5jbHVkaW5nIE1UMjcwMSAm
IE1UODE3MyAmCm10ODE4MwoKU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVk
aWF0ZWsuY29tPgotLS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRw
aS50eHQgICAgICAgIHwgMTEgKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHBpLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS50eHQKaW5kZXggYjZhN2U3
Mzk3YjhiLi5jZDZhMTQ2OWM4YjcgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS50eHQKKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHBp
LnR4dApAQCAtNyw2ICs3LDcgQEAgb3V0cHV0IGJ1cy4KIAogUmVxdWlyZWQgcHJvcGVydGllczoK
IC0gY29tcGF0aWJsZTogIm1lZGlhdGVrLDxjaGlwPi1kcGkiCisgIHRoZSBzdXBwb3J0ZWQgY2hp
cHMgYXJlIG10MjcwMSAsIG10ODE3MyBhbmQgbXQ4MTgzLgogLSByZWc6IFBoeXNpY2FsIGJhc2Ug
YWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSBjb250cm9sbGVyJ3MgcmVnaXN0ZXJzCiAtIGludGVy
cnVwdHM6IFRoZSBpbnRlcnJ1cHQgc2lnbmFsIGZyb20gdGhlIGZ1bmN0aW9uIGJsb2NrLgogLSBj
bG9ja3M6IGRldmljZSBjbG9ja3MKQEAgLTE2LDYgKzE3LDExIEBAIFJlcXVpcmVkIHByb3BlcnRp
ZXM6CiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncmFwaC50eHQuIFRoaXMg
cG9ydCBzaG91bGQgYmUgY29ubmVjdGVkCiAgIHRvIHRoZSBpbnB1dCBwb3J0IG9mIGFuIGF0dGFj
aGVkIEhETUkgb3IgTFZEUyBlbmNvZGVyIGNoaXAuCiAKK09wdGlvbmFsIHByb3BlcnRpZXM6Cist
IGRwaV9waW5fbW9kZV9zd2FwOiBTd2FwIHRoZSBwaW4gbW9kZSBiZXR3ZWVuIGRwaSBtb2RlIGFu
ZCBncGlvIG1vZGUuCistIHBpbmN0cmwtbmFtZXM6IENvbnRhaW4gImdwaW9tb2RlIiBhbmQgImRw
aW1vZGUiLgorLSBkcGlfZHVhbF9lZGdlOiBDb250cm9sIHRoZSBSR0IgMjRiaXQgZGF0YSBvbiAx
MiBwaW5zIG9yIDI0IHBpbnMuCisKIEV4YW1wbGU6CiAKIGRwaTA6IGRwaUAxNDAxZDAwMCB7CkBA
IC0yNiw2ICszMiwxMSBAQCBkcGkwOiBkcGlAMTQwMWQwMDAgewogCQkgPCZtbXN5cyBDTEtfTU1f
RFBJX0VOR0lORT4sCiAJCSA8JmFwbWl4ZWRzeXMgQ0xLX0FQTUlYRURfVFZEUExMPjsKIAljbG9j
ay1uYW1lcyA9ICJwaXhlbCIsICJlbmdpbmUiLCAicGxsIjsKKwlkcGlfZHVhbF9lZGdlOworCWRw
aV9waW5fbW9kZV9zd2FwOworCXBpbmN0cmwtbmFtZXMgPSAiZ3Bpb21vZGUiLCAiZHBpbW9kZSI7
CisJcGluY3RybC0wID0gPCZkcGlfcGluX2dwaW8+OworCXBpbmN0cmwtMSA9IDwmZHBpX3Bpbl9m
dW5jPjsKIAogCXBvcnQgewogCQlkcGkwX291dDogZW5kcG9pbnQgewotLSAKMi4yMS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
