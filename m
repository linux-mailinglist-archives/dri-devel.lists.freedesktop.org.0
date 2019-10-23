Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C66E1FDC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 17:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B446EB23;
	Wed, 23 Oct 2019 15:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649DD6EB1F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 15:45:36 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3C5CF28F984;
 Wed, 23 Oct 2019 16:45:34 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 20/21] dt-bindings: display: panel: Add the LTA089AC29000
 variant
Date: Wed, 23 Oct 2019 17:45:11 +0200
Message-Id: <20191023154512.9762-21-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023154512.9762-1-boris.brezillon@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Chris Healy <cphealy@gmail.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIExUQTA4OUFDMjkwMDAgYW5kIExUMDg5QUMyOTAwMCBhcmUgbm90IGV4YWN0bHkgdGhlIHNh
bWUuIExldCdzIGFkZAphIG5ldyBjb21wYXRpYmxlIGZvciB0aGUgTFRBIHZhcmlhbnQuCgpTaWdu
ZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PgotLS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3Rvc2hpYmEsbHQwODlhYzI5MDAwLnR4
dCAgICAgICAgICB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC90b3NoaWJhLGx0MDg5YWMyOTAwMC50eHQgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC90b3NoaWJhLGx0MDg5YWMyOTAwMC50
eHQKaW5kZXggODk4MjYxMTY2MjhjLi4yNmViZmEwOTg5NjYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3Rvc2hpYmEsbHQwODlhYzI5
MDAwLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9w
YW5lbC90b3NoaWJhLGx0MDg5YWMyOTAwMC50eHQKQEAgLTEsNyArMSwxMCBAQAogVG9zaGliYSA4
LjkiIFdYR0EgKDEyODB4NzY4KSBURlQgTENEIHBhbmVsCiAKIFJlcXVpcmVkIHByb3BlcnRpZXM6
Ci0tIGNvbXBhdGlibGU6IHNob3VsZCBiZSAidG9zaGliYSxsdDA4OWFjMjkwMDAiCistIGNvbXBh
dGlibGU6IHNob3VsZCBiZSBvbmUgb2YgdGhlIGZvbGxvd2luZworCSAgICAgICJ0b3NoaWJhLGx0
MDg5YWMyOTAwMCIKKwkgICAgICAidG9zaGliYSxsdGEwODlhYzI5MDAwIgorCiAtIHBvd2VyLXN1
cHBseTogYXMgc3BlY2lmaWVkIGluIHRoZSBiYXNlIGJpbmRpbmcKIAogVGhpcyBiaW5kaW5nIGlz
IGNvbXBhdGlibGUgd2l0aCB0aGUgc2ltcGxlLXBhbmVsIGJpbmRpbmcsIHdoaWNoIGlzIHNwZWNp
ZmllZAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
