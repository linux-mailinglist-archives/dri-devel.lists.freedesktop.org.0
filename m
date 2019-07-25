Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C475F76286
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBFA6ECF4;
	Fri, 26 Jul 2019 09:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr
 [80.12.242.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA936E815
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 18:40:01 +0000 (UTC)
Received: from localhost.localdomain ([92.140.204.221]) by mwinf5d13 with ME
 id h6fu2000Y4n7eLC036fwcM; Thu, 25 Jul 2019 20:40:00 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 25 Jul 2019 20:40:00 +0200
X-ME-IP: 92.140.204.221
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: gregkh@linuxfoundation.org,
	nishadkamdar@gmail.com
Subject: [PATCH] Staging: fbtft: Fix some typo. pdc8544 --> pcd8544
Date: Thu, 25 Jul 2019 20:38:56 +0200
Message-Id: <20190725183856.17616-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciBpcyByZWxhdGVkIHRvICdwY2Q4NTQ0Jy4KSG93ZXZlciwgMiBzdHJpbmdzIGFy
ZSBhYm91dCBwZGM4NTQ0IChjIGFuZCBkIHN3aXRjaGVkKQpGaXggaXQuCgpTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPgotLS0K
VGhpcyBwYXRjaCBpcyBvbmx5IHRoZW9yaWNhbC4gSXQgaXMgYmFzZWQgb24gdGhlIGZhY3QgdGhh
dCBhIHBhcnQgb2YgdGhlCmZpbGVuYW1lIChpLmUuIHBjZDg1NDQpIGxvb2tzIG1pc3NwZWxsZWQg
aW4gdGhlIGZpbGUgaXRzZWxmLgpJIGRvbid0IGtub3cgdGhlIGltcGxpY2F0aW9uIG9mIEZCVEZU
X1JFR0lTVEVSX0RSSVZFUiBhbmQgTU9EVUxFX0FMSUFTIGFuZAppZiBhZGRpdGlvbmFsIGFkanVz
dG1lbnRzIGFyZSBuZWVkZWQuCi0tLQogZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZiX3BjZDg1NDQu
YyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJfcGNkODU0NC5jIGIvZHJp
dmVycy9zdGFnaW5nL2ZidGZ0L2ZiX3BjZDg1NDQuYwppbmRleCBhZDQ5OTczYWQ1OTQuLjA4Zjhh
NGJiODc3MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZiX3BjZDg1NDQuYwor
KysgYi9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJfcGNkODU0NC5jCkBAIC0xNTcsMTAgKzE1Nywx
MCBAQCBzdGF0aWMgc3RydWN0IGZidGZ0X2Rpc3BsYXkgZGlzcGxheSA9IHsKIAkuYmFja2xpZ2h0
ID0gMSwKIH07CiAKLUZCVEZUX1JFR0lTVEVSX0RSSVZFUihEUlZOQU1FLCAicGhpbGlwcyxwZGM4
NTQ0IiwgJmRpc3BsYXkpOworRkJURlRfUkVHSVNURVJfRFJJVkVSKERSVk5BTUUsICJwaGlsaXBz
LHBjZDg1NDQiLCAmZGlzcGxheSk7CiAKIE1PRFVMRV9BTElBUygic3BpOiIgRFJWTkFNRSk7Ci1N
T0RVTEVfQUxJQVMoInNwaTpwZGM4NTQ0Iik7CitNT0RVTEVfQUxJQVMoInNwaTpwY2Q4NTQ0Iik7
CiAKIE1PRFVMRV9ERVNDUklQVElPTigiRkIgZHJpdmVyIGZvciB0aGUgUENEODU0NCBMQ0QgQ29u
dHJvbGxlciIpOwogTU9EVUxFX0FVVEhPUigiTm9yYWxmIFRyb25uZXMiKTsKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
