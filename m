Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D067BB8003
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 19:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5F86F4CC;
	Thu, 19 Sep 2019 17:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFBB6F4CC
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 17:30:24 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1BDB21928;
 Thu, 19 Sep 2019 17:30:23 +0000 (UTC)
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 1/2] MAINTAINERS: Update Allwinner DRM drivers entry
Date: Thu, 19 Sep 2019 19:30:19 +0200
Message-Id: <20190919173020.11655-1-mripard@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568914224;
 bh=21/IjosP+LtJLPZp6ABCh4apWOiNakxej0e5jWIlrdY=;
 h=From:To:Cc:Subject:Date:From;
 b=ZTmHLSbOSa5pXAUHGBUYdakLJzC8rvWqz+judrWSQv3i9Ad97cnnTEOb12IkuvBkU
 oVv/n8tJzQrrwZS+jXBqfXfdonCTWk0VO+26Xp5uDg4EWXebJi6fqSFJi2aZ/htey9
 JUOnonIjHlVpC+P0/4W/dmiST8hMVzIEug5IH3nQ=
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
Cc: jernej.skrabec@siol.net, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIERSTSBkcml2ZXJzIGFyZSBtb3JlIHRoYW4gYWJvdXQgdGhlIEExMCBub3csIHNvIGxldCdz
IG1ha2UgdGhlIGVudHJ5Cm5hbWUgYSBiaXQgbW9yZSBnZW5lcmljLgoKQWxzbywgQ2hlbi1ZdSBo
YXMgYmVlbiBhIGRlLWZhY3RvIG1haW50YWluZXIgZm9yIHRoZSBEUk0gZHJpdmVyIGZvciBhCndo
aWxlLCBpcyBhIG1haW50YWluZXIgb2YgdGhlIEFsbHdpbm5lciBwbGF0Zm9ybSBmb3IgYW4gZXZl
biBsb25nZXIgdGltZSwKYW5kIGhhcyBkcm0tbWlzYyBjb21taXQgYWNjZXNzLiBMZXQncyBtYWtl
IGl0IGZvcm1hbCBhbmQgYWRkIGhpbSBhcyBhCm1haW50YWluZXIuCgpTaWduZWQtb2ZmLWJ5OiBN
YXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Ci0tLQogTUFJTlRBSU5FUlMgfCAzICsr
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggYjIzMjZkZWNlMjhlLi41NGUy
MjJlMWQwZDYgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC01
MzUyLDggKzUzNTIsOSBAQCBGOglpbmNsdWRlL2RybS9kcm0qCiBGOglpbmNsdWRlL3VhcGkvZHJt
L2RybSoKIEY6CWluY2x1ZGUvbGludXgvdmdhKgogCi1EUk0gRFJJVkVSUyBGT1IgQUxMV0lOTkVS
IEExMAorRFJNIERSSVZFUlMgRk9SIEFMTFdJTk5FUiBTT0NTCiBNOglNYXhpbWUgUmlwYXJkIDxt
cmlwYXJkQGtlcm5lbC5vcmc+CitNOglDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+CiBMOglk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCiBTOglTdXBwb3J0ZWQKIEY6CWRyaXZlcnMv
Z3B1L2RybS9zdW40aS8KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
