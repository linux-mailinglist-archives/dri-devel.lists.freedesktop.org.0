Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4723CD4C43
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2019 05:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208646E44C;
	Sat, 12 Oct 2019 03:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 385916E44C
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 03:07:44 +0000 (UTC)
X-UUID: a7ae752649c44a32aaedd58358b56650-20191012
X-UUID: a7ae752649c44a32aaedd58358b56650-20191012
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 300671732; Sat, 12 Oct 2019 11:07:38 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sat, 12 Oct 2019 11:07:35 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sat, 12 Oct 2019 11:07:35 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 1/8] dt-bindings: display: panel: Add BOE tv101wum-n16
 panel bindings
Date: Sat, 12 Oct 2019 11:07:13 +0800
Message-ID: <20191012030720.27127-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191012030720.27127-1-jitao.shi@mediatek.com>
References: <20191012030720.27127-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1F593AE9540F5609EEAC88FFC384396BD18BB529265AFB2C694D3109790BE48A2000:8
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

QWRkIGRvY3VtZW50YXRpb24gZm9yIGJvZSB0djEwMXd1bS1uMTYgcGFuZWwuCgpTaWduZWQtb2Zm
LWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+ClJldmlld2VkLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Ci0tLQogLi4uL2Rpc3BsYXkvcGFuZWwvYm9lLHR2
MTAxd3VtLW5sNi55YW1sICAgICAgIHwgNjcgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDY3IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9ib2UsdHYxMDF3dW0tbmw2LnlhbWwK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9w
YW5lbC9ib2UsdHYxMDF3dW0tbmw2LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9ib2UsdHYxMDF3dW0tbmw2LnlhbWwKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4yNTQ0NzY4MmY4MjYKLS0tIC9kZXYvbnVsbAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9ib2UsdHYx
MDF3dW0tbmw2LnlhbWwKQEAgLTAsMCArMSw2NyBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMAorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3Nj
aGVtYXMvZGlzcGxheS9wYW5lbC9ib2UsdHYxMDF3dW0tbmw2LnlhbWwjCiskc2NoZW1hOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IEJPRSBU
VjEwMVdVTS1ObDYgRFNJIERpc3BsYXkgUGFuZWwKKworbWFpbnRhaW5lcnM6CisgIC0gVGhpZXJy
eSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KKyAgLSBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+CisgIC0gUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4KKwor
cHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICAgICAgY29uc3Q6IGJvZSx0djEwMXd1bS1u
bDYKKworICByZWc6CisgICAgZGVzY3JpcHRpb246IHRoZSB2aXJ0dWFsIGNoYW5uZWwgbnVtYmVy
IG9mIGEgRFNJIHBlcmlwaGVyYWwKKworICBlbmFibGUtZ3Bpb3M6CisgICAgZGVzY3JpcHRpb246
IGEgR1BJTyBzcGVjIGZvciB0aGUgZW5hYmxlIHBpbgorCisgIHBwMTgwMC1zdXBwbHk6CisgICAg
ZGVzY3JpcHRpb246IGNvcmUgdm9sdGFnZSBzdXBwbHkKKworICBhdmRkLXN1cHBseToKKyAgICBk
ZXNjcmlwdGlvbjogcGhhbmRsZSBvZiB0aGUgcmVndWxhdG9yIHRoYXQgcHJvdmlkZXMgcG9zaXRp
dmUgdm9sdGFnZQorCisgIGF2ZWUtc3VwcGx5OgorICAgIGRlc2NyaXB0aW9uOiBwaGFuZGxlIG9m
IHRoZSByZWd1bGF0b3IgdGhhdCBwcm92aWRlcyBuZWdhdGl2ZSB2b2x0YWdlCisKKyAgYmFja2xp
Z2h0OgorICAgIGRlc2NyaXB0aW9uOiBwaGFuZGxlIG9mIHRoZSBiYWNrbGlnaHQgZGV2aWNlIGF0
dGFjaGVkIHRvIHRoZSBwYW5lbAorCityZXF1aXJlZDoKKyAtIGNvbXBhdGlibGUKKyAtIHJlZwor
IC0gZW5hYmxlLWdwaW9zCisgLSBwcDE4MDAtc3VwcGx5CisgLSBhdmRkLXN1cHBseQorIC0gYXZl
ZS1zdXBwbHkKKyAtIGJhY2tsaWdodAorCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKKwor
ZXhhbXBsZXM6CisgIC0gfAorICAgICZkc2kgeworICAgICAgICBwYW5lbEAwIHsKKyAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAiYm9lLHR2MTAxd3VtLW5sNiI7CisgICAgICAgICAgICByZWcgPSA8
MD47CisgICAgICAgICAgICBlbmFibGUtZ3Bpb3MgPSA8JnBpbyA0NSAwPjsKKyAgICAgICAgICAg
IGF2ZGQtc3VwcGx5ID0gPCZwcHZhcm5fbGNkPjsKKyAgICAgICAgICAgIGF2ZWUtc3VwcGx5ID0g
PCZwcHZhcnBfbGNkPjsKKyAgICAgICAgICAgIHBwMTgwMC1zdXBwbHkgPSA8JnBwMTgwMF9sY2Q+
OworICAgICAgICAgICAgYmFja2xpZ2h0ID0gPCZiYWNrbGlnaHRfbGNkMD47CisgICAgICAgICAg
ICBzdGF0dXMgPSAib2theSI7CisgICAgICAgICAgICBwb3J0IHsKKyAgICAgICAgICAgICAgICBw
YW5lbF9pbjogZW5kcG9pbnQgeworICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQg
PSA8JmRzaV9vdXQ+OworICAgICAgICAgICAgICAgIH07CisgICAgICAgICAgICB9OworICAgICAg
ICB9OworICAgIH07CisKKy4uLgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
