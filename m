Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 705D024565A
	for <lists+dri-devel@lfdr.de>; Sun, 16 Aug 2020 09:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75FE6E1D8;
	Sun, 16 Aug 2020 07:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1716E0E5
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 07:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id D5D2EFB03;
 Sun, 16 Aug 2020 09:13:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qke4M50PDNVY; Sun, 16 Aug 2020 09:13:45 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id DC491457CD; Sun, 16 Aug 2020 09:13:43 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: panel: rocktech,
 jh057n00900: Add myself as maintainer
Date: Sun, 16 Aug 2020 09:13:43 +0200
Message-Id: <9427a9c0e6aaf9fb375f7ecee6691ba491149d52.1597561897.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597561897.git.agx@sigxcpu.org>
References: <cover.1597561897.git.agx@sigxcpu.org>
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

SSBtYWludGFpbmVkIHRoZSB0eHQgYmFzZWQgYmluZGluZ3MgYmVmb3JlIHlhbWwgY29udmVyc2lv
biBhbmQgY2FyZQphYm91dCB0aGUgZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogR3VpZG8gR8O8bnRo
ZXIgPGFneEBzaWd4Y3B1Lm9yZz4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3BhbmVsL3JvY2t0ZWNoLGpoMDU3bjAwOTAwLnlhbWwgIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9yb2NrdGVjaCxqaDA1N24wMDkwMC55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcm9ja3RlY2gsamgwNTduMDA5
MDAueWFtbAppbmRleCBjOTdlODk3MDczNDJlLi4wOWI1ZWI3NTQyZjhhIDEwMDY0NAotLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9yb2NrdGVjaCxq
aDA1N24wMDkwMC55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL3JvY2t0ZWNoLGpoMDU3bjAwOTAwLnlhbWwKQEAgLTgsNiArOCw3IEBAIHRp
dGxlOiBSb2NrdGVjaCBKSDA1N04wMDkwMCA1LjUiIDcyMHgxNDQwIFRGVCBMQ0QgcGFuZWwKIAog
bWFpbnRhaW5lcnM6CiAgIC0gT25kcmVqIEppcm1hbiA8bWVnaUB4ZmYuY3o+CisgIC0gR3VpZG8g
R8WtbnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KIAogZGVzY3JpcHRpb246CiAgIFJvY2t0ZWNoIEpI
MDU3TjAwOTAwIGlzIGEgNzIweDE0NDAgVEZUIExDRCBwYW5lbAotLSAKMi4yNi4yCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
