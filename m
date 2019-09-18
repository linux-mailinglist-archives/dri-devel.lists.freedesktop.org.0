Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AF0B630F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 14:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF626EF17;
	Wed, 18 Sep 2019 12:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0DA386EF17
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 12:24:48 +0000 (UTC)
X-UUID: d29e70cc54294481af88269ce82fb1d8-20190918
X-UUID: d29e70cc54294481af88269ce82fb1d8-20190918
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 456800172; Wed, 18 Sep 2019 20:24:38 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 18 Sep 2019 20:24:36 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 18 Sep 2019 20:24:35 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 3/8] dt-bindings: display: panel: add auo kd101n80-45na
 panel bindings
Date: Wed, 18 Sep 2019 20:24:17 +0800
Message-ID: <20190918122422.17339-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918122422.17339-1-jitao.shi@mediatek.com>
References: <20190918122422.17339-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 640B2EA5D55BC499E8715F5AB8F134A548DD1D12A742CB2162D683930316C13F2000:8
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
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uY2FmODI3NjVmYTBlCi0tLSAvZGV2L251bGwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXVv
LGtkMTAxbjgwLTQ1bmEueWFtbApAQCAtMCwwICsxLDY3IEBACisjIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL2F1byxrZDEwMW44MC00NW5hLnlhbWwjCiskc2NoZW1h
OiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6
IEFVTyBLRDEwMU44MC00NU5BIERTSSBEaXNwbGF5IFBhbmVsCisKK21haW50YWluZXJzOgorICAt
IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CisgIC0gU2FtIFJhdm5i
b3JnIDxzYW1AcmF2bmJvcmcub3JnPgorICAtIFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5v
cmc+CisgCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgICAgICBjb25zdDogYXVvLGtk
MTAxbjgwLTQ1bmEKKworICByZWc6CisgICAgZGVzY3JpcHRpb246IHRoZSB2aXJ0dWFsIGNoYW5u
ZWwgbnVtYmVyIG9mIGEgRFNJIHBlcmlwaGVyYWwKKworICBlbmFibGUtZ3Bpb3M6CisgICAgZGVz
Y3JpcHRpb246IGEgR1BJTyBzcGVjIGZvciB0aGUgZW5hYmxlIHBpbgorCisgIHBwMTgwMC1zdXBw
bHk6CisgICAgZGVzY3JpcHRpb246IGNvcmUgdm9sdGFnZSBzdXBwbHkKKworICBhdmRkLXN1cHBs
eToKKyAgICBkZXNjcmlwdGlvbjogcGhhbmRsZSBvZiB0aGUgcmVndWxhdG9yIHRoYXQgcHJvdmlk
ZXMgcG9zaXRpdmUgdm9sdGFnZQorCisgIGF2ZWUtc3VwcGx5OgorICAgIGRlc2NyaXB0aW9uOiBw
aGFuZGxlIG9mIHRoZSByZWd1bGF0b3IgdGhhdCBwcm92aWRlcyBuZWdhdGl2ZSB2b2x0YWdlCisK
KyAgYmFja2xpZ2h0OgorICAgIGRlc2NyaXB0aW9uOiBwaGFuZGxlIG9mIHRoZSBiYWNrbGlnaHQg
ZGV2aWNlIGF0dGFjaGVkIHRvIHRoZSBwYW5lbAorCityZXF1aXJlZDoKKyAtIGNvbXBhdGlibGUK
KyAtIHJlZworIC0gZW5hYmxlLWdwaW9zCisgLSBwcDE4MDAtc3VwcGx5CisgLSBhdmRkLXN1cHBs
eQorIC0gYXZlZS1zdXBwbHkKKyAtIGJhY2tsaWdodAorCithZGRpdGlvbmFsUHJvcGVydGllczog
ZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgICZkc2kgeworICAgICAgICBwYW5lbEAwIHsK
KyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXVvLGtkMTAxbjgwLTQ1bmEiOworICAgICAgICAg
ICAgcmVnID0gPDA+OworICAgICAgICAgICAgZW5hYmxlLWdwaW9zID0gPCZwaW8gNDUgMD47Cisg
ICAgICAgICAgICBhdmRkLXN1cHBseSA9IDwmcHB2YXJuX2xjZD47CisgICAgICAgICAgICBhdmVl
LXN1cHBseSA9IDwmcHB2YXJwX2xjZD47CisgICAgICAgICAgICBwcDE4MDAtc3VwcGx5ID0gPCZw
cDE4MDBfbGNkPjsKKyAgICAgICAgICAgIGJhY2tsaWdodCA9IDwmYmFja2xpZ2h0X2xjZDA+Owor
ICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOworICAgICAgICAgICAgcG9ydCB7CisgICAgICAg
ICAgICAgICAgcGFuZWxfaW46IGVuZHBvaW50IHsKKyAgICAgICAgICAgICAgICAgICAgcmVtb3Rl
LWVuZHBvaW50ID0gPCZkc2lfb3V0PjsKKyAgICAgICAgICAgICAgICB9OworICAgICAgICAgICAg
fTsKKyAgICAgICAgfTsKKyAgICB9OworCisuLi4KXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxl
Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
