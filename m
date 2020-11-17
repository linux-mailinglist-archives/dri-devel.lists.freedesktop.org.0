Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59282B6C46
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 18:49:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3A489C18;
	Tue, 17 Nov 2020 17:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1D889C18
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 17:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id E490EFB05;
 Tue, 17 Nov 2020 18:49:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OKR7asW2yOyz; Tue, 17 Nov 2020 18:49:42 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 34CBD43F73; Tue, 17 Nov 2020 18:49:38 +0100 (CET)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megous@megous.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 allen <allen.chen@ite.com.tw>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/6] dt-bindings: vendor-prefixes: Add ys vendor prefix
Date: Tue, 17 Nov 2020 18:49:36 +0100
Message-Id: <a4930fb7a7464e4feedbdae993fe25080c8f5490.1605635248.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1605635248.git.agx@sigxcpu.org>
References: <cover.1605635248.git.agx@sigxcpu.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHByZWZpeCBmb3IgU2hlbnpoZW4gWWFzaGkgQ2hhbmdodWEgSW50ZWxsaWdlbnQgVGVjaG5v
bG9neSBDby4sIEx0ZC4KClNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNw
dS5vcmc+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVm
aXhlcy55YW1sIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMu
eWFtbAppbmRleCBlNDBlZTM2OWY4MDguLmQwZjNhYmYyZjEyYyAxMDA2NDQKLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sCisrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbApAQCAt
MTIyMCw2ICsxMjIwLDggQEAgcGF0dGVyblByb3BlcnRpZXM6CiAgICAgZGVzY3JpcHRpb246IFNo
ZW56aGVuIFlhbmdsaW1pbmcgRWxlY3Ryb25pYyBUZWNobm9sb2d5IENvLiwgTHRkLgogICAiXnlu
YSwuKiI6CiAgICAgZGVzY3JpcHRpb246IFlTSCAmIEFUSUwKKyAgIl55cywuKiI6CisgICAgZGVz
Y3JpcHRpb246IFNoZW56aGVuIFlhc2hpIENoYW5naHVhIEludGVsbGlnZW50IFRlY2hub2xvZ3kg
Q28uLCBMdGQuCiAgICJeeW9uZXMtdG9wdGVjaCwuKiI6CiAgICAgZGVzY3JpcHRpb246IFlvbmVz
IFRvcHRlY2ggQ28uLCBMdGQuCiAgICJeeXNvZnQsLioiOgotLSAKMi4yOS4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
