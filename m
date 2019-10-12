Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54FDD4C4B
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2019 05:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D3C6ECA9;
	Sat, 12 Oct 2019 03:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id B564C6ECA9
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 03:07:59 +0000 (UTC)
X-UUID: cfbfcefb92fc43e5aed137a2b7424aa6-20191012
X-UUID: cfbfcefb92fc43e5aed137a2b7424aa6-20191012
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1211227749; Sat, 12 Oct 2019 11:07:52 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sat, 12 Oct 2019 11:07:50 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sat, 12 Oct 2019 11:07:49 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 5/8] dt-bindings: display: panel: add boe tv101wum-n53
 panel documentation
Date: Sat, 12 Oct 2019 11:07:17 +0800
Message-ID: <20191012030720.27127-6-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191012030720.27127-1-jitao.shi@mediatek.com>
References: <20191012030720.27127-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1684-8.5.1010-24970.000
X-TM-AS-Result: No-3.344400-8.000000-10
X-TMASE-MatchedRID: LDQTIb3AkScn3vOf0l6OFgPZZctd3P4By733NwuklsIHQvT9S3vHUDgK
 6rBjXxyiwmiM4j3WsDwWIvAeOZ6lZBhzK7qAlTSLCLQsumV/5S9V3dLaYUoCPSS30GKAkBxWie3
 MY7Xv0phqry+54H7wDufAOkxShVgK5TDi4+38dPYgCPGiZqtI8Gp5nbEBTsLkrNaeJrYvUQiKWS
 pN2IMPKUPNs5J6pUBWmkLIyx+kbq+tsBhZwL3bDR23b+lJHvPAhdipnqZWlN6LT3esmGQfwEtTy
 K8ZTWCGZI1BYYTjZ96AMuqetGVetr9k4V4N5ceA3QfwsVk0UbsIoUKaF27lxa+VNt27m34VrKYl
 gqznSc4xP9Zy6unRStfmgibWsLHGTgsevC4sB+C0btMs1U/nhob6DPwnZOM0denzLfRnwSvqqRM
 MGfOl4nWznloeB3HaPQzwIbfiR5AMD9LTK+5Nny0c7FwZxihenqg/VrSZEiM=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.344400-8.000000
X-TMASE-Version: SMEX-12.5.0.1684-8.5.1010-24970.000
X-TM-SNTS-SMTP: 6D9C4C56DB1E911528170B75A9D921C0E5DB4CF1DAD720447BBF5B3C009627462000:8
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
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uY2VlYmE4ZDk1NDg2Ci0tLSAvZGV2L251
bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
Ym9lLHR2MTAxd3VtLW41My55YW1sCkBAIC0wLDAgKzEsNjcgQEAKKyMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9zY2hlbWFzL2Rpc3BsYXkvcGFuZWwvYm9lLHR2MTAxd3VtLW41My55YW1sIworJHNjaGVt
YTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxl
OiBCT0UgVFYxMDFXVU0tTjUzIERTSSBEaXNwbGF5IFBhbmVsCisKK21haW50YWluZXJzOgorICAt
IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CisgIC0gU2FtIFJhdm5i
b3JnIDxzYW1AcmF2bmJvcmcub3JnPgorICAtIFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5v
cmc+CisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgICAgIGNvbnN0OiBib2UsdHYx
MDF3dW0tbjUzCisKKyAgcmVnOgorICAgIGRlc2NyaXB0aW9uOiB0aGUgdmlydHVhbCBjaGFubmVs
IG51bWJlciBvZiBhIERTSSBwZXJpcGhlcmFsCisKKyAgZW5hYmxlLWdwaW9zOgorICAgIGRlc2Ny
aXB0aW9uOiBhIEdQSU8gc3BlYyBmb3IgdGhlIGVuYWJsZSBwaW4KKworICBwcDE4MDAtc3VwcGx5
OgorICAgIGRlc2NyaXB0aW9uOiBjb3JlIHZvbHRhZ2Ugc3VwcGx5CisKKyAgYXZkZC1zdXBwbHk6
CisgICAgZGVzY3JpcHRpb246IHBoYW5kbGUgb2YgdGhlIHJlZ3VsYXRvciB0aGF0IHByb3ZpZGVz
IHBvc2l0aXZlIHZvbHRhZ2UKKworICBhdmVlLXN1cHBseToKKyAgICBkZXNjcmlwdGlvbjogcGhh
bmRsZSBvZiB0aGUgcmVndWxhdG9yIHRoYXQgcHJvdmlkZXMgbmVnYXRpdmUgdm9sdGFnZQorCisg
IGJhY2tsaWdodDoKKyAgICBkZXNjcmlwdGlvbjogcGhhbmRsZSBvZiB0aGUgYmFja2xpZ2h0IGRl
dmljZSBhdHRhY2hlZCB0byB0aGUgcGFuZWwKKworcmVxdWlyZWQ6CisgLSBjb21wYXRpYmxlCisg
LSByZWcKKyAtIGVuYWJsZS1ncGlvcworIC0gcHAxODAwLXN1cHBseQorIC0gYXZkZC1zdXBwbHkK
KyAtIGF2ZWUtc3VwcGx5CisgLSBiYWNrbGlnaHQKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZh
bHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICAmZHNpIHsKKyAgICAgICAgcGFuZWxAMCB7Cisg
ICAgICAgICAgICBjb21wYXRpYmxlID0gImJvZSx0djEwMXd1bS1uNTMiOworICAgICAgICAgICAg
cmVnID0gPDA+OworICAgICAgICAgICAgZW5hYmxlLWdwaW9zID0gPCZwaW8gNDUgMD47CisgICAg
ICAgICAgICBhdmRkLXN1cHBseSA9IDwmcHB2YXJuX2xjZD47CisgICAgICAgICAgICBhdmVlLXN1
cHBseSA9IDwmcHB2YXJwX2xjZD47CisgICAgICAgICAgICBwcDE4MDAtc3VwcGx5ID0gPCZwcDE4
MDBfbGNkPjsKKyAgICAgICAgICAgIGJhY2tsaWdodCA9IDwmYmFja2xpZ2h0X2xjZDA+OworICAg
ICAgICAgICAgc3RhdHVzID0gIm9rYXkiOworICAgICAgICAgICAgcG9ydCB7CisgICAgICAgICAg
ICAgICAgcGFuZWxfaW46IGVuZHBvaW50IHsKKyAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVu
ZHBvaW50ID0gPCZkc2lfb3V0PjsKKyAgICAgICAgICAgICAgICB9OworICAgICAgICAgICAgfTsK
KyAgICAgICAgfTsKKyAgICB9OworCisuLi4KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
