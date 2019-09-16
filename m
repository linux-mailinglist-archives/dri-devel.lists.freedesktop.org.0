Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC2CB335B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 04:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7386E0AA;
	Mon, 16 Sep 2019 02:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1C46A6E0AA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 02:30:15 +0000 (UTC)
X-UUID: 3ab4dc6e48524a638730dfc321835554-20190916
X-UUID: 3ab4dc6e48524a638730dfc321835554-20190916
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 482570151; Mon, 16 Sep 2019 10:30:12 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 16 Sep 2019 10:30:11 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Mon, 16 Sep 2019 10:30:10 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 7/8] dt-bindings: display: panel: add AUO auo,
 b101uan08.3 panel documentation
Date: Mon, 16 Sep 2019 10:29:40 +0800
Message-ID: <20190916022941.15404-8-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190916022941.15404-1-jitao.shi@mediatek.com>
References: <20190916022941.15404-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1684-8.5.1010-24914.001
X-TM-AS-Result: No-4.309100-8.000000-10
X-TMASE-MatchedRID: YTzvI92rr1In3vOf0l6OFgPZZctd3P4By733NwuklsIHQvT9S3vHUDgK
 6rBjXxyiwmiM4j3WsDwCBQl2B+K9DUyOkx83/VM/Hbdv6Uke88BUE+MH85/4VPa7agslQWYYTXO
 j1XBAu3Dq/qW/Ghd+7SUJyrN1VessmvwPHdTg3FZqZ6OipRp3etJknNWM2wudUjFJwpdmcrS4jQ
 UH2MU9MGULUrNPkXXmBLbGmf83XzMkqjAuFnBndJ4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyJ8TM
 nmE+d0ZEU3csG6sUi/t0t7xVBP/YJliqu9HysuRSgtyPPDaBmpzV/XzfPIofBsQaDji93llVqMw
 UBMnm3N/Tt4aX/HW8fgqhcxGRbCankZgNaqizbL2z+v/HlGkuMCaqSgwpYR4eYa+lS0uTdBWXGv
 UUmKP2w==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.309100-8.000000
X-TMASE-Version: SMEX-12.5.0.1684-8.5.1010-24914.001
X-TM-SNTS-SMTP: 6C5B8B914B1853EEC219B9B6DFFB7DF9AD0E2EA83787766D2FFFEB08C8DE93822000:8
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
Cc: Jitao
 Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRjdW1lbnRhdGlvbiBmb3IgYXVvLGIxMDF1YW4wOC4zLCB3aGljaCBpcyBtaXBpIGRzaSB2
aWRlbyBwYW5lbAphbmQgcmVzb2x1dGlvbiBpcyAxMjAweDE5MjAuCgpTaWduZWQtb2ZmLWJ5OiBK
aXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Ci0tLQogLi4uL2Rpc3BsYXkvcGFuZWwv
YXVvLGIxMDF1YW4wOC4zLnR4dCAgICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hdW8sYjEwMXVhbjA4LjMu
dHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvYXVvLGIxMDF1YW4wOC4zLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL2F1byxiMTAxdWFuMDguMy50eHQKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi43YTMxY2ZlNTM0YWMKLS0tIC9kZXYvbnVsbAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hdW8sYjEw
MXVhbjA4LjMudHh0CkBAIC0wLDAgKzEsMzQgQEAKK0FVTyBDb3Jwb3JhdGlvbiAxMC4xIiBXVVhH
QSBURlQgTENEIHBhbmVsCisKK1JlcXVpcmVkIHByb3BlcnRpZXM6CistIGNvbXBhdGlibGU6IHNo
b3VsZCBiZSAiYXVvLGIxMDF1YW4wOC4zIgorLSByZWc6IHRoZSB2aXJ0dWFsIGNoYW5uZWwgbnVt
YmVyIG9mIGEgRFNJIHBlcmlwaGVyYWwKKy0gZW5hYmxlLWdwaW9zOiBhIEdQSU8gc3BlYyBmb3Ig
dGhlIGVuYWJsZSBwaW4KKy0gcHAxODAwLXN1cHBseTogY29yZSB2b2x0YWdlIHN1cHBseQorLSBh
dmRkLXN1cHBseTogcGhhbmRsZSBvZiB0aGUgcmVndWxhdG9yIHRoYXQgcHJvdmlkZXMgcG9zaXRp
dmUgdm9sdGFnZQorLSBhdmVlLXN1cHBseTogcGhhbmRsZSBvZiB0aGUgcmVndWxhdG9yIHRoYXQg
cHJvdmlkZXMgbmVnYXRpdmUgdm9sdGFnZQorLSBiYWNrbGlnaHQ6IHBoYW5kbGUgb2YgdGhlIGJh
Y2tsaWdodCBkZXZpY2UgYXR0YWNoZWQgdG8gdGhlIHBhbmVsCisKK1RoZSBkZXZpY2Ugbm9kZSBj
YW4gY29udGFpbiBvbmUgJ3BvcnQnIGNoaWxkIG5vZGUgd2l0aCBvbmUgY2hpbGQKKydlbmRwb2lu
dCcgbm9kZSwgYWNjb3JkaW5nIHRvIHRoZSBiaW5kaW5ncyBkZWZpbmVkIGluCittZWRpYS92aWRl
by1pbnRlcmZhY2VzLnR4dC4gVGhpcyBub2RlIHNob3VsZCBkZXNjcmliZSBwYW5lbCdzIHZpZGVv
IGJ1cy4KKworRXhhbXBsZToKKyZkc2kgeworCS4uLgorCXBhbmVsQDAgeworCQljb21wYXRpYmxl
ID0gImF1byxiMTAxdWFuMDguMyI7CisJCXJlZyA9IDwwPjsKKwkJZW5hYmxlLWdwaW9zID0gPCZw
aW8gNDUgMD47CisJCWF2ZGQtc3VwcGx5ID0gPCZwcHZhcm5fbGNkPjsKKwkJYXZlZS1zdXBwbHkg
PSA8JnBwdmFycF9sY2Q+OworCQlwcDE4MDAtc3VwcGx5ID0gPCZwcDE4MDBfbGNkPjsKKwkJYmFj
a2xpZ2h0ID0gPCZiYWNrbGlnaHRfbGNkMD47CisJCXN0YXR1cyA9ICJva2F5IjsKKwkJcG9ydCB7
CisJCQlwYW5lbF9pbjogZW5kcG9pbnQgeworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHNpX291
dD47CisJCQl9OworCQl9OworCX07Cit9OwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
