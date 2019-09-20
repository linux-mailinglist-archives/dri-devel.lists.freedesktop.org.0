Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE74B8D64
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 11:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3FB6FBD4;
	Fri, 20 Sep 2019 09:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3EB5C6FBD4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 09:04:54 +0000 (UTC)
X-UUID: 205e9101046a4c0eb8a78c301b7703d3-20190920
X-UUID: 205e9101046a4c0eb8a78c301b7703d3-20190920
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 2084014177; Fri, 20 Sep 2019 17:04:46 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 20 Sep 2019 17:04:46 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Fri, 20 Sep 2019 17:04:45 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 1/5] dt-bindings: display: mediatek: update dsi supported
 chips
Date: Fri, 20 Sep 2019 17:04:28 +0800
Message-ID: <20190920090432.3308-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190920090432.3308-1-jitao.shi@mediatek.com>
References: <20190920090432.3308-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2686D8E8CCEA4A8E8D7ABBDCE83AFA48ADF3126AF7F4732C01B7CEA7406D19F72000:8
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
 stonea168@163.com, cawa.cheng@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXBkYXRlIGRldmljZSB0cmVlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIGRzaSBmb3IK
TWVkaWF0ZWsgTVQ4MTgzIFNvQ3MuCgpTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNo
aUBtZWRpYXRlay5jb20+CkFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgot
LS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQgICAgfCAx
NSArKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2kudHh0CmluZGV4IGZh
ZGYzMjdjN2NkZi4uOTkzZmYwNzlhYzA5IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2kudHh0CisrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
LGRzaS50eHQKQEAgLTcsNyArNyw3IEBAIGNoYW5uZWwgb3V0cHV0LgogCiBSZXF1aXJlZCBwcm9w
ZXJ0aWVzOgogLSBjb21wYXRpYmxlOiAibWVkaWF0ZWssPGNoaXA+LWRzaSIKLSAgdGhlIHN1cHBv
cnRlZCBjaGlwcyBhcmUgbXQyNzAxIGFuZCBtdDgxNzMuCisgIHRoZSBzdXBwb3J0ZWQgY2hpcHMg
YXJlIG10MjcwMSwgbXQ4MTczIGFuZCBtdDgxODMuCiAtIHJlZzogUGh5c2ljYWwgYmFzZSBhZGRy
ZXNzIGFuZCBsZW5ndGggb2YgdGhlIGNvbnRyb2xsZXIncyByZWdpc3RlcnMKIC0gaW50ZXJydXB0
czogVGhlIGludGVycnVwdCBzaWduYWwgZnJvbSB0aGUgZnVuY3Rpb24gYmxvY2suCiAtIGNsb2Nr
czogZGV2aWNlIGNsb2NrcwpAQCAtMjYsMjIgKzI2LDMxIEBAIFRoZSBNSVBJIFRYIGNvbmZpZ3Vy
YXRpb24gbW9kdWxlIGNvbnRyb2xzIHRoZSBNSVBJIEQtUEhZLgogCiBSZXF1aXJlZCBwcm9wZXJ0
aWVzOgogLSBjb21wYXRpYmxlOiAibWVkaWF0ZWssPGNoaXA+LW1pcGktdHgiCi0gIHRoZSBzdXBw
b3J0ZWQgY2hpcHMgYXJlIG10MjcwMSBhbmQgbXQ4MTczLgorICB0aGUgc3VwcG9ydGVkIGNoaXBz
IGFyZSBtdDI3MDEsIG10ODE3MyBhbmQgbXQ4MTgzLgogLSByZWc6IFBoeXNpY2FsIGJhc2UgYWRk
cmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSBjb250cm9sbGVyJ3MgcmVnaXN0ZXJzCiAtIGNsb2Nrczog
UExMIHJlZmVyZW5jZSBjbG9jawogLSBjbG9jay1vdXRwdXQtbmFtZXM6IG5hbWUgb2YgdGhlIG91
dHB1dCBjbG9jayBsaW5lIHRvIHRoZSBEU0kgZW5jb2RlcgogLSAjY2xvY2stY2VsbHM6IG11c3Qg
YmUgPDA+OwogLSAjcGh5LWNlbGxzOiBtdXN0IGJlIDwwPi4KIAorT3B0aW9uYWwgcHJvcGVydGll
czoKKy0gbnZtZW0tY2VsbHM6IEEgcGhhbmRsZSB0byB0aGUgY2FsaWJyYXRpb24gZGF0YSBwcm92
aWRlZCBieSBhIG52bWVtIGRldmljZS4gSWYKKyAgICAgICAgICAgICAgIHVuc3BlY2lmaWVkIGRl
ZmF1bHQgdmFsdWVzIHNoYWxsIGJlIHVzZWQuCistIG52bWVtLWNlbGwtbmFtZXM6IFNob3VsZCBi
ZSAiY2FsaWJyYXRpb24tZGF0YSIKKy0gbWlwaXR4LWN1cnJlbnQtZHJpdmU6IGFkanVzdCBkcml2
aW5nIGN1cnJlbnQsIHNob3VsZCBiZSAxIH4gMHhGCisKIEV4YW1wbGU6CiAKIG1pcGlfdHgwOiBt
aXBpLWRwaHlAMTAyMTUwMDAgewogCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLW1pcGkt
dHgiOwogCXJlZyA9IDwwIDB4MTAyMTUwMDAgMCAweDEwMDA+OwogCWNsb2NrcyA9IDwmY2xrMjZt
PjsKLQljbG9jay1vdXRwdXQtbmFtZXMgPSAibWlwaV90eDBfcGxsIjsKIAkjY2xvY2stY2VsbHMg
PSA8MD47CiAJI3BoeS1jZWxscyA9IDwwPjsKKwljbG9jay1vdXRwdXQtbmFtZXMgPSAibWlwaV90
eDBfcGxsIjsKKwludm1lbS1jZWxscz0gPCZtaXBpX3R4X2NhbGlicmF0aW9uPjsKKwludm1lbS1j
ZWxsLW5hbWVzID0gImNhbGlicmF0aW9uLWRhdGEiOworCW1pcGl0eC1jdXJyZW50LWRyaXZlID0g
PDB4OD47CiB9OwogCiBkc2kwOiBkc2lAMTQwMWIwMDAgewotLSAKMi4yMS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
