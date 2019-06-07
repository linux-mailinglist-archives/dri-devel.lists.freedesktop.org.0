Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B565E399C9
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 01:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37D3891C2;
	Fri,  7 Jun 2019 23:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BDA891C2
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 23:47:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [109.132.30.162])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE6E531A;
 Sat,  8 Jun 2019 01:47:57 +0200 (CEST)
Date: Sat, 8 Jun 2019 02:47:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [GIT PULL FOR v5.3] R-Car DU changes
Message-ID: <20190607234743.GD5110@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559951277;
 bh=/RHszLjp1uQGQ16i2uj7YXjP5Jf0cYTkdbnlD4r0ksM=;
 h=Date:From:To:Cc:Subject:From;
 b=K2ckc+dAVR35dMb6c6vU3G+7IaZWGyHdaHo/kpig1/ZXY+qUTUUB2cN+7EAqLwK6i
 T6Ix9WBdHMVXqXIOYRle7fN1SZqfbgxCZEq2zWJpb95JO+3iS0/eHTYpGHq8oydTo8
 WXp0HzRH5wtm+iB8ZQsbBYPWN/BkQ0LDzXYhQqY8=
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
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYTE4ODMzOWNhNWEz
OTZhY2M1ODhlNTg1MWVkN2UxOWY2NmIwZWJkOToKCiAgTGludXggNS4yLXJjMSAoMjAxOS0wNS0x
OSAxNTo0NzowOSAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0
OgoKICBnaXQ6Ly9saW51eHR2Lm9yZy9waW5jaGFydGwvbWVkaWEuZ2l0IHRhZ3MvZHUtbmV4dC0y
MDE5MDYwOAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDhlOGZkZGFiMGQwYWNkZWZi
MWFkNzY4NTJkOTU0YjJiYmFhMzg5NmQ6CgogIGRybTogcmNhci1kdTogU2tpcCBMVkRTMSBvdXRw
dXQgb24gR2VuMyB3aGVuIHVzaW5nIGR1YWwtbGluayBMVkRTIG1vZGUgKDIwMTktMDYtMDggMDI6
MzY6MDQgKzAzMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tClItQ2FyIERVIGNoYW5nZXMgZm9yIHY1LjM6CgotIFI4QTc3
NEExIFNvQyBzdXBwb3J0Ci0gTFZEUyBkdWFsLWxpbmsgbW9kZSBzdXBwb3J0Ci0gTWlzYyBmaXhl
cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpCaWp1IERhcyAoNCk6CiAgICAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiByZW5l
c2FzOiBkdTogRG9jdW1lbnQgdGhlIHI4YTc3NGExIGJpbmRpbmdzCiAgICAgIGR0LWJpbmRpbmdz
OiBkaXNwbGF5OiByZW5lc2FzOiBsdmRzOiBEb2N1bWVudCByOGE3NzRhMSBiaW5kaW5ncwogICAg
ICBkcm06IHJjYXItZHU6IEFkZCBSOEE3NzRBMSBzdXBwb3J0CiAgICAgIGRybTogcmNhci1kdTog
bHZkczogQWRkIHI4YTc3NGExIHN1cHBvcnQKCktpZXJhbiBCaW5naGFtICgxKToKICAgICAgZHJt
OiByY2FyLWR1OiB3cml0ZWJhY2s6IGluY2x1ZGUgaW50ZXJmYWNlIGhlYWRlcgoKTGF1cmVudCBQ
aW5jaGFydCAoNyk6CiAgICAgIGRybTogYnJpZGdlOiBBZGQgZHVhbF9saW5rIGZpZWxkIHRvIHRo
ZSBkcm1fYnJpZGdlX3RpbWluZ3Mgc3RydWN0dXJlCiAgICAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5
OiBicmlkZ2U6IHRoYzYzbHZkMTAyNDogRG9jdW1lbnQgZHVhbC1saW5rIG9wZXJhdGlvbgogICAg
ICBkcm06IGJyaWRnZTogdGhjNjM6IFJlcG9ydCBpbnB1dCBidXMgbW9kZSB0aHJvdWdoIGJyaWRn
ZSB0aW1pbmdzCiAgICAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiByZW5lc2FzOiBsdmRzOiBBZGQg
cmVuZXNhcyxjb21wYW5pb24gcHJvcGVydHkKICAgICAgZHJtOiByY2FyLWR1OiBsdmRzOiBSZW1v
dmUgTFZEUyBkb3VibGUtZW5hYmxlIGNoZWNrcwogICAgICBkcm06IHJjYXItZHU6IGx2ZHM6IEFk
ZCBzdXBwb3J0IGZvciBkdWFsLWxpbmsgbW9kZQogICAgICBkcm06IHJjYXItZHU6IFNraXAgTFZE
UzEgb3V0cHV0IG9uIEdlbjMgd2hlbiB1c2luZyBkdWFsLWxpbmsgTFZEUyBtb2RlCgogLi4uL2Jp
bmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy50eHQgICAgICAgfCAgMTkgKystCiAu
Li4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGhpbmUsdGhjNjNsdmQxMDI0LnR4dCB8ICAgNiAr
CiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsZHUudHh0ICAgICB8ICAg
MiArCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RoYzYzbHZkMTAyNC5jICAgICAgICAgICAgICB8
ICA1NCArKysrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMgICAg
ICAgICAgICAgIHwgIDMwICsrKysrCiBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Vu
Y29kZXIuYyAgICAgICAgICB8ICAxMiArKwogZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9k
dV9rbXMuYyAgICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3Jj
YXJfZHVfd3JpdGViYWNrLmMgICAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1
L3JjYXJfbHZkcy5jICAgICAgICAgICAgICAgIHwgMTI3ICsrKysrKysrKysrKysrKy0tLS0tLQog
ZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmggICAgICAgICAgICAgICAgfCAgIDUg
KwogaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDggKysKIDExIGZpbGVzIGNoYW5nZWQsIDIxOCBpbnNlcnRpb25zKCspLCA0OCBkZWxldGlvbnMo
LSkKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
