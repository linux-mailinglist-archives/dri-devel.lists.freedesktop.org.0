Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 657DB2B766
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 16:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EA9896ED;
	Mon, 27 May 2019 14:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A468989736
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 14:17:48 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hVGRe-0001Z6-OB; Mon, 27 May 2019 16:17:46 +0200
Message-ID: <1558966666.4039.4.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv-fixes for 5.2-rc3
From: Lucas Stach <l.stach@pengutronix.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 27 May 2019 16:17:46 +0200
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLCBoaSBEYXZlLAoKcGxlYXNlIHB1bGwgaW4gdGhpcyBmaXggZm9yIGEga2VybmVs
IGNyYXNoaW5nIHZtYWxsb2MgYnVmZmVyIG92ZXJydW4gaW4KdGhlIGV0bmF2aXYgZGV2Y29yZWR1
bXAgY29kZS4KClJlZ2FyZHMsCkx1Y2FzCgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNv
bW1pdCBhMTg4MzM5Y2E1YTM5NmFjYzU4OGU1ODUxZWQ3ZTE5ZjY2YjBlYmQ5OgoKICBMaW51eCA1
LjItcmMxICgyMDE5LTA1LTE5IDE1OjQ3OjA5IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUg
R2l0IHJlcG9zaXRvcnkgYXQ6CgogIGh0dHBzOi8vZ2l0LnBlbmd1dHJvbml4LmRlL2dpdC9sc3Qv
bGludXggZXRuYXZpdi9maXhlcwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDEzOTY1
MDBkNjczYmQwMjc2ODNhMDYwOWZmODRkY2E3ZWI2ZWEyZTc6CgogIGRybS9ldG5hdml2OiBsb2Nr
IE1NVSB3aGlsZSBkdW1waW5nIGNvcmUgKDIwMTktMDUtMjcgMTY6MDg6MzggKzAyMDApCgotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCkx1Y2FzIFN0YWNoICgxKToKICAgICAgZHJtL2V0bmF2aXY6IGxvY2sgTU1VIHdoaWxlIGR1
bXBpbmcgY29yZQoKIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHVtcC5jIHwgNSAr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
