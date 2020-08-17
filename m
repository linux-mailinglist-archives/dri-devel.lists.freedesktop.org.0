Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C802A245EFA
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 10:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808596E4D4;
	Mon, 17 Aug 2020 08:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8486E4D4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 08:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 23E91FB06;
 Mon, 17 Aug 2020 10:14:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6JoWR7m6hpnH; Mon, 17 Aug 2020 10:14:37 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 414D44017D; Mon, 17 Aug 2020 10:14:36 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Daniel Palmer <daniel@0x0f.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 allen <allen.chen@ite.com.tw>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add mantix vendor prefix
Date: Mon, 17 Aug 2020 10:14:34 +0200
Message-Id: <b6bcfe27d9393a07a5cdd82fcf211620c774a273.1597652012.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597652012.git.agx@sigxcpu.org>
References: <cover.1597652012.git.agx@sigxcpu.org>
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

QWRkIHByZWZpeCBmb3IgTWFudGl4IERpc3BsYXkgVGVjaG5vbG9neSBDby4sTHRkLgoKU2lnbmVk
LW9mZi1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KQWNrZWQtYnk6IFNhbSBS
YXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sCmluZGV4IDJiYWVlMmM4MTdjMWEuLjU5ZDRjOGIwNjhj
NGQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3It
cHJlZml4ZXMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVu
ZG9yLXByZWZpeGVzLnlhbWwKQEAgLTYxMSw2ICs2MTEsOCBAQCBwYXR0ZXJuUHJvcGVydGllczoK
ICAgICBkZXNjcmlwdGlvbjogTGludXggQXV0b21hdGlvbiBHbWJICiAgICJebWFjbmljYSwuKiI6
CiAgICAgZGVzY3JpcHRpb246IE1hY25pY2EgQW1lcmljYXMKKyAgIl5tYW50aXgsLioiOgorICAg
IGRlc2NyaXB0aW9uOiBNYW50aXggRGlzcGxheSBUZWNobm9sb2d5IENvLixMdGQuCiAgICJebWFw
bGVib2FyZCwuKiI6CiAgICAgZGVzY3JpcHRpb246IE1hcGxlYm9hcmQub3JnCiAgICJebWFydmVs
bCwuKiI6Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
