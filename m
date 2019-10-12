Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D50D4C4F
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2019 05:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFA36ECAB;
	Sat, 12 Oct 2019 03:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id A69B46ECAB
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 03:08:07 +0000 (UTC)
X-UUID: dccf3e8f73db492aac111e4e3abb8f9f-20191012
X-UUID: dccf3e8f73db492aac111e4e3abb8f9f-20191012
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 672420713; Sat, 12 Oct 2019 11:08:03 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sat, 12 Oct 2019 11:08:01 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sat, 12 Oct 2019 11:08:00 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 7/8] dt-bindings: display: panel: add AUO auo,
 b101uan08.3 panel documentation
Date: Sat, 12 Oct 2019 11:07:19 +0800
Message-ID: <20191012030720.27127-8-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191012030720.27127-1-jitao.shi@mediatek.com>
References: <20191012030720.27127-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B70586468D2BD0343EE48FF2AEA44985450C8B4BDE7D2E95CCCE327EA0ECA9D42000:8
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

QWRkIGRjdW1lbnRhdGlvbiBmb3IgYXVvLGIxMDF1YW4wOC4zLCB3aGljaCBpcyBtaXBpIGRzaSB2
aWRlbyBwYW5lbAphbmQgcmVzb2x1dGlvbiBpcyAxMjAweDE5MjAuCgpTaWduZWQtb2ZmLWJ5OiBK
aXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Ci0tLQogLi4uL2Rpc3BsYXkvcGFuZWwv
YXVvLGIxMDF1YW4wOC4zLnlhbWwgICAgICAgIHwgNjcgKysrKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hdW8sYjEwMXVhbjA4LjMu
eWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL2F1byxiMTAxdWFuMDguMy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXVvLGIxMDF1YW4wOC4zLnlhbWwKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5jMDkzOWY4YzcyNzQKLS0tIC9kZXYvbnVsbAor
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hdW8s
YjEwMXVhbjA4LjMueWFtbApAQCAtMCwwICsxLDY3IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
c2NoZW1hcy9kaXNwbGF5L3BhbmVsL2F1byxiMTAxdWFuMDguMy55YW1sIworJHNjaGVtYTogaHR0
cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBBVU8g
QjEwMVVBTjA4LjMgRFNJIERpc3BsYXkgUGFuZWwKKworbWFpbnRhaW5lcnM6CisgIC0gVGhpZXJy
eSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KKyAgLSBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+CisgIC0gUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4KKwor
cHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICAgICAgY29uc3Q6IGF1byxiMTAxdWFuMDgu
MworCisgIHJlZzoKKyAgICBkZXNjcmlwdGlvbjogdGhlIHZpcnR1YWwgY2hhbm5lbCBudW1iZXIg
b2YgYSBEU0kgcGVyaXBoZXJhbAorCisgIGVuYWJsZS1ncGlvczoKKyAgICBkZXNjcmlwdGlvbjog
YSBHUElPIHNwZWMgZm9yIHRoZSBlbmFibGUgcGluCisKKyAgcHAxODAwLXN1cHBseToKKyAgICBk
ZXNjcmlwdGlvbjogY29yZSB2b2x0YWdlIHN1cHBseQorCisgIGF2ZGQtc3VwcGx5OgorICAgIGRl
c2NyaXB0aW9uOiBwaGFuZGxlIG9mIHRoZSByZWd1bGF0b3IgdGhhdCBwcm92aWRlcyBwb3NpdGl2
ZSB2b2x0YWdlCisKKyAgYXZlZS1zdXBwbHk6CisgICAgZGVzY3JpcHRpb246IHBoYW5kbGUgb2Yg
dGhlIHJlZ3VsYXRvciB0aGF0IHByb3ZpZGVzIG5lZ2F0aXZlIHZvbHRhZ2UKKworICBiYWNrbGln
aHQ6CisgICAgZGVzY3JpcHRpb246IHBoYW5kbGUgb2YgdGhlIGJhY2tsaWdodCBkZXZpY2UgYXR0
YWNoZWQgdG8gdGhlIHBhbmVsCisKK3JlcXVpcmVkOgorIC0gY29tcGF0aWJsZQorIC0gcmVnCisg
LSBlbmFibGUtZ3Bpb3MKKyAtIHBwMTgwMC1zdXBwbHkKKyAtIGF2ZGQtc3VwcGx5CisgLSBhdmVl
LXN1cHBseQorIC0gYmFja2xpZ2h0CisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitl
eGFtcGxlczoKKyAgLSB8CisgICAgJmRzaSB7CisgICAgICAgIHBhbmVsQDAgeworICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJhdW8sYjEwMXVhbjA4LjMiOworICAgICAgICAgICAgcmVnID0gPDA+
OworICAgICAgICAgICAgZW5hYmxlLWdwaW9zID0gPCZwaW8gNDUgMD47CisgICAgICAgICAgICBh
dmRkLXN1cHBseSA9IDwmcHB2YXJuX2xjZD47CisgICAgICAgICAgICBhdmVlLXN1cHBseSA9IDwm
cHB2YXJwX2xjZD47CisgICAgICAgICAgICBwcDE4MDAtc3VwcGx5ID0gPCZwcDE4MDBfbGNkPjsK
KyAgICAgICAgICAgIGJhY2tsaWdodCA9IDwmYmFja2xpZ2h0X2xjZDA+OworICAgICAgICAgICAg
c3RhdHVzID0gIm9rYXkiOworICAgICAgICAgICAgcG9ydCB7CisgICAgICAgICAgICAgICAgcGFu
ZWxfaW46IGVuZHBvaW50IHsKKyAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0g
PCZkc2lfb3V0PjsKKyAgICAgICAgICAgICAgICB9OworICAgICAgICAgICAgfTsKKyAgICAgICAg
fTsKKyAgICB9OworCisuLi4KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
