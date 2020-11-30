Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 162DB2C8336
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 12:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE346E44F;
	Mon, 30 Nov 2020 11:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D797D89798
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 11:29:06 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1kjhMe-00033r-2D; Mon, 30 Nov 2020 12:29:04 +0100
Message-ID: <81367a99b8949584e5becd334ac001b9ad3dc37a.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv-next for 5.11
From: Lucas Stach <l.stach@pengutronix.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 30 Nov 2020 12:29:03 +0100
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgaGkgRGFuaWVsLAoKcGxlYXNlIHB1bGwgdGhlIGZvbGxvd2luZyBldG5hdml2IHVw
ZGF0ZXMgZm9yIDUuMTEuCgpBZ2Fpbiwgbm90aGluZyBiaWcgdGhpcyB0aW1lLiBNb3N0bHkgYSBu
ZXcgcGVyZm9ybWFuY2UgY291bnRlciBmcm9tCkNocmlzdGlhbiwgc29tZSBtb3JlIGxvY2tkZXAg
YW5ub3RhdGlvbnMgZnJvbSBHdWlkbyBhbmQgcmVtb3ZhbCBvZgpmdW5jdGlvbmFsaXR5IHRoYXQg
ZHVwbGljYXRlcyBkcml2ZXIgY29yZSBmcm9tIFJvYmluLgogClJlZ2FyZHMsCkx1Y2FzCgoKVGhl
IGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA5MTIzZTNhNzRlYzdiOTM0YTRhMDk5ZTk4
YWY2YTYxYzJmODBiYmY1OgoKICBMaW51eCA1LjktcmMxICgyMDIwLTA4LTE2IDEzOjA0OjU3IC0w
NzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGh0dHBzOi8v
Z2l0LnBlbmd1dHJvbml4LmRlL2dpdC9sc3QvbGludXggZXRuYXZpdi9uZXh0Cgpmb3IgeW91IHRv
IGZldGNoIGNoYW5nZXMgdXAgdG8gNDYxMmJhZDU3MDFlMTU4ZjNjNDA5NTFmMmM3YWE4ZTY0YjM0
NDVlYjoKCiAgZHJtL2V0bmF2aXY6IEFkZCBsb2NrZGVwIGFubm90YXRpb25zIGZvciBjb250ZXh0
IGxvY2sgKDIwMjAtMTAtMzAgMTU6MzM6NTkgKzAxMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkNocmlzdGlhbiBHbWVp
bmVyICg0KToKICAgICAgZHJtL2V0bmF2aXY6IHJlbmFtZSBwaXBlX3JlZ19yZWFkKC4uKQogICAg
ICBkcm0vZXRuYXZpdjogY2FsbCBwZXJmX3JlZ19yZWFkKC4uKQogICAgICBkcm0vZXRuYXZpdjog
YWRkIHRvdGFsIGhpIGJhbmR3aWR0aCBwZXJmY291bnRlcgogICAgICBkcm0vZXRuYXZpdjogYWRk
IHBpcGVfc2VsZWN0KC4uKSBoZWxwZXIKCkd1aWRvIEfDvG50aGVyICgxKToKICAgICAgZHJtL2V0
bmF2aXY6IEFkZCBsb2NrZGVwIGFubm90YXRpb25zIGZvciBjb250ZXh0IGxvY2sKClJvYmluIE11
cnBoeSAoMSk6CiAgICAgIGRybS9ldG5hdml2OiBEcm9wIGxvY2FsIGRtYV9wYXJtcwoKIGRyaXZl
cnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHJ2LmMgICAgIHwgIDMgLS0KIGRyaXZlcnMvZ3B1
L2RybS9ldG5hdml2L2V0bmF2aXZfZHJ2LmggICAgIHwgIDEgLQogZHJpdmVycy9ncHUvZHJtL2V0
bmF2aXYvZXRuYXZpdl9tbXUuYyAgICAgfCAgNCArKysKIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2
L2V0bmF2aXZfcGVyZm1vbi5jIHwgNzggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDU5IGluc2VydGlvbnMoKyksIDI3
IGRlbGV0aW9ucygtKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
