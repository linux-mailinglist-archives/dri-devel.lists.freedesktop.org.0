Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6488FB335C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 04:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2CD6E0DA;
	Mon, 16 Sep 2019 02:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 22DD66E0AA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 02:30:10 +0000 (UTC)
X-UUID: ff25d7aa78504ef8a644a12692a2bd2f-20190916
X-UUID: ff25d7aa78504ef8a644a12692a2bd2f-20190916
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 250707718; Mon, 16 Sep 2019 10:30:07 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 16 Sep 2019 10:30:06 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Mon, 16 Sep 2019 10:30:05 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 5/8] dt-bindings: display: panel: add boe tv101wum-n53
 panel documentation
Date: Mon, 16 Sep 2019 10:29:38 +0800
Message-ID: <20190916022941.15404-6-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190916022941.15404-1-jitao.shi@mediatek.com>
References: <20190916022941.15404-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A3F385A883601703994C308500DFF60BDF8FF3405BD9EFA91D5E213D386999F82000:8
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
 stonea168@163.com, cawa.cheng@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRjdW1lbnRhdGlvbiBmb3IgYm9lLHR2MTAxd3VtLW41Mywgd2hpY2ggaXMgbWlwaSBkc2kg
dmlkZW8gcGFuZWwKYW5kIHJlc29sdXRpb24gaXMgMTIwMHgxOTIwLgoKU2lnbmVkLW9mZi1ieTog
Sml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgotLS0KIC4uLi9kaXNwbGF5L3BhbmVs
L2JvZSx0djEwMXd1bS1uNTMudHh0ICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYm9lLHR2MTAxd3VtLW41
My50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9wYW5lbC9ib2UsdHYxMDF3dW0tbjUzLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2JvZSx0djEwMXd1bS1uNTMudHh0Cm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uMTQ1YTBiMmE4MGEwCi0tLSAvZGV2L251bGwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYm9l
LHR2MTAxd3VtLW41My50eHQKQEAgLTAsMCArMSwzNCBAQAorQk9FIENvcnBvcmF0aW9uIDEwLjEi
IFdVWEdBIFRGVCBMQ0QgcGFuZWwKKworUmVxdWlyZWQgcHJvcGVydGllczoKKy0gY29tcGF0aWJs
ZTogc2hvdWxkIGJlICJib2UsdHYxMDF3dW0tbjUzIgorLSByZWc6IHRoZSB2aXJ0dWFsIGNoYW5u
ZWwgbnVtYmVyIG9mIGEgRFNJIHBlcmlwaGVyYWwKKy0gZW5hYmxlLWdwaW9zOiBhIEdQSU8gc3Bl
YyBmb3IgdGhlIGVuYWJsZSBwaW4KKy0gcHAxODAwLXN1cHBseTogY29yZSB2b2x0YWdlIHN1cHBs
eQorLSBhdmRkLXN1cHBseTogcGhhbmRsZSBvZiB0aGUgcmVndWxhdG9yIHRoYXQgcHJvdmlkZXMg
cG9zaXRpdmUgdm9sdGFnZQorLSBhdmVlLXN1cHBseTogcGhhbmRsZSBvZiB0aGUgcmVndWxhdG9y
IHRoYXQgcHJvdmlkZXMgbmVnYXRpdmUgdm9sdGFnZQorLSBiYWNrbGlnaHQ6IHBoYW5kbGUgb2Yg
dGhlIGJhY2tsaWdodCBkZXZpY2UgYXR0YWNoZWQgdG8gdGhlIHBhbmVsCisKK1RoZSBkZXZpY2Ug
bm9kZSBjYW4gY29udGFpbiBvbmUgJ3BvcnQnIGNoaWxkIG5vZGUgd2l0aCBvbmUgY2hpbGQKKydl
bmRwb2ludCcgbm9kZSwgYWNjb3JkaW5nIHRvIHRoZSBiaW5kaW5ncyBkZWZpbmVkIGluCittZWRp
YS92aWRlby1pbnRlcmZhY2VzLnR4dC4gVGhpcyBub2RlIHNob3VsZCBkZXNjcmliZSBwYW5lbCdz
IHZpZGVvIGJ1cy4KKworRXhhbXBsZToKKyZkc2kgeworCS4uLgorCXBhbmVsQDAgeworCQljb21w
YXRpYmxlID0gImJvZSx0djEwMXd1bS1uNTMiOworCQlyZWcgPSA8MD47CisJCWVuYWJsZS1ncGlv
cyA9IDwmcGlvIDQ1IDA+OworCQlhdmRkLXN1cHBseSA9IDwmcHB2YXJuX2xjZD47CisJCWF2ZWUt
c3VwcGx5ID0gPCZwcHZhcnBfbGNkPjsKKwkJcHAxODAwLXN1cHBseSA9IDwmcHAxODAwX2xjZD47
CisJCWJhY2tsaWdodCA9IDwmYmFja2xpZ2h0X2xjZDA+OworCQlzdGF0dXMgPSAib2theSI7CisJ
CXBvcnQgeworCQkJcGFuZWxfaW46IGVuZHBvaW50IHsKKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8
JmRzaV9vdXQ+OworCQkJfTsKKwkJfTsKKwl9OworfTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
