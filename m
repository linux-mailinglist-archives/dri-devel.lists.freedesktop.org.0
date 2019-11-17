Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EEAFF907
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE886E31D;
	Sun, 17 Nov 2019 11:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B406E279
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 07:11:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 9647528FCB7
Received: by earth.universe (Postfix, from userid 1000)
 id 6D9463C0CB5; Sun, 17 Nov 2019 03:41:40 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [RFCv1 41/42] ARM: dts: omap4-droid4: add panel compatible
Date: Sun, 17 Nov 2019 03:40:27 +0100
Message-Id: <20191117024028.2233-42-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:18 +0000
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIERyb2lkIDQgc3BlY2lmaWMgY29tcGF0aWJsZSB2YWx1ZSBpbiBhZGRpdGlvbiB0byB0aGUK
Z2VuZXJpYyBvbmUsIHNvIHRoYXQgd2UgaGF2ZSB0aGUgYWJpbGl0eSB0byBhZGQgcGFuZWwKc3Bl
Y2lmaWMgcXVpcmtzIGluIHRoZSBmdXR1cmUuCgpTaWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gUmVp
Y2hlbCA8c2ViYXN0aWFuLnJlaWNoZWxAY29sbGFib3JhLmNvbT4KLS0tCiBhcmNoL2FybS9ib290
L2R0cy9vbWFwNC1kcm9pZDQteHQ4OTQuZHRzIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMv
b21hcDQtZHJvaWQ0LXh0ODk0LmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL29tYXA0LWRyb2lkNC14
dDg5NC5kdHMKaW5kZXggNmFmMGE5Mjg4OTQwLi5kNTY2ODk5OGFhOWQgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvYXJtL2Jvb3QvZHRzL29tYXA0LWRyb2lkNC14dDg5NC5kdHMKKysrIGIvYXJjaC9hcm0vYm9v
dC9kdHMvb21hcDQtZHJvaWQ0LXh0ODk0LmR0cwpAQCAtMjAzLDcgKzIwMyw3IEBACiAJfTsKIAog
CWxjZDA6IHBhbmVsQDAgewotCQljb21wYXRpYmxlID0gInBhbmVsLWRzaS1jbSI7CisJCWNvbXBh
dGlibGUgPSAibW90b3JvbGEsZHJvaWQ0LXBhbmVsIiwgInBhbmVsLWRzaS1jbSI7CiAJCXJlZyA9
IDwwPjsKIAkJbGFiZWwgPSAibGNkMCI7CiAJCXZkZGktc3VwcGx5ID0gPCZsY2RfcmVndWxhdG9y
PjsKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
