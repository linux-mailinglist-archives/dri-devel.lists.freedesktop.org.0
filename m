Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F5FE4557
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 10:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01E86E8ED;
	Fri, 25 Oct 2019 08:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDBB6E446
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 15:17:43 +0000 (UTC)
Received: from ramsan ([84.195.182.253]) by laurent.telenet-ops.be with bizsmtp
 id HTHh2100K5USYZQ01THhsz; Thu, 24 Oct 2019 17:17:41 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iNert-0006yo-A6; Thu, 24 Oct 2019 17:17:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iNert-0007d9-89; Thu, 24 Oct 2019 17:17:41 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jiri Kosina <trivial@kernel.org>
Subject: [PATCH trivial] drm: Spelling s/connet/connect/
Date: Thu, 24 Oct 2019 17:17:37 +0200
Message-Id: <20191024151737.29287-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 25 Oct 2019 08:11:50 +0000
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IG1pc3NwZWxsaW5ncyBvZiAiY29ubmVjdG9yIiBhbmQgImNvbm5lY3Rpb24iCgpTaWduZWQt
b2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvbWRmbGRfZHNpX291dHB1dC5jIHwgMiArLQogaW5jbHVk
ZS91YXBpL2RybS9leHlub3NfZHJtLmggICAgICAgICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZ21hNTAwL21kZmxkX2RzaV9vdXRwdXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1
MDAvbWRmbGRfZHNpX291dHB1dC5jCmluZGV4IDAzMDIzZmEwZmI2ZjlkM2MuLmYzNTBhYzFlYWQx
ODIxM2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvbWRmbGRfZHNpX291dHB1
dC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvbWRmbGRfZHNpX291dHB1dC5jCkBAIC00
OTgsNyArNDk4LDcgQEAgdm9pZCBtZGZsZF9kc2lfb3V0cHV0X2luaXQoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwKIAkJcmV0dXJuOwogCX0KIAotCS8qY3JlYXRlIGEgbmV3IGNvbm5ldG9yKi8KKwkv
KmNyZWF0ZSBhIG5ldyBjb25uZWN0b3IqLwogCWRzaV9jb25uZWN0b3IgPSBremFsbG9jKHNpemVv
ZihzdHJ1Y3QgbWRmbGRfZHNpX2Nvbm5lY3RvciksIEdGUF9LRVJORUwpOwogCWlmICghZHNpX2Nv
bm5lY3RvcikgewogCQlEUk1fRVJST1IoIk5vIG1lbW9yeSIpOwpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS91YXBpL2RybS9leHlub3NfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL2V4eW5vc19kcm0uaApp
bmRleCAzZTU5YjgzODJkZDhjZWFkLi40NWM2NTgyYjNkZjMxZGJmIDEwMDY0NAotLS0gYS9pbmNs
dWRlL3VhcGkvZHJtL2V4eW5vc19kcm0uaAorKysgYi9pbmNsdWRlL3VhcGkvZHJtL2V4eW5vc19k
cm0uaApAQCAtNjgsNyArNjgsNyBAQCBzdHJ1Y3QgZHJtX2V4eW5vc19nZW1faW5mbyB7CiAvKioK
ICAqIEEgc3RydWN0dXJlIGZvciB1c2VyIGNvbm5lY3Rpb24gcmVxdWVzdCBvZiB2aXJ0dWFsIGRp
c3BsYXkuCiAgKgotICogQGNvbm5lY3Rpb246IGluZGljYXRlIHdoZXRoZXIgZG9pbmcgY29ubmV0
aW9uIG9yIG5vdCBieSB1c2VyLgorICogQGNvbm5lY3Rpb246IGluZGljYXRlIHdoZXRoZXIgZG9p
bmcgY29ubmVjdGlvbiBvciBub3QgYnkgdXNlci4KICAqIEBleHRlbnNpb25zOiBpZiB0aGlzIHZh
bHVlIGlzIDEgdGhlbiB0aGUgdmlkaSBkcml2ZXIgd291bGQgbmVlZCBhZGRpdGlvbmFsCiAgKgkx
MjhieXRlcyBlZGlkIGRhdGEuCiAgKiBAZWRpZDogdGhlIGVkaWQgZGF0YSBwb2ludGVyIGZyb20g
dXNlciBzaWRlLgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
