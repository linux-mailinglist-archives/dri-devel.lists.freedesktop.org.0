Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C4278F2F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 17:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A6F89CF3;
	Mon, 29 Jul 2019 15:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cam-smtp0.cambridge.arm.com (fw-tnat-cam2.arm.com
 [217.140.106.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3132589CF3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 15:27:59 +0000 (UTC)
Received: from e110455-lin.cambridge.arm.com (e110455-lin.cambridge.arm.com
 [10.2.131.35])
 by cam-smtp0.cambridge.arm.com (8.13.8/8.13.8) with ESMTP id x6TFRtPh012226;
 Mon, 29 Jul 2019 16:27:55 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] tests/util/kms.c: Add module names for Arm display
 drivers.
Date: Mon, 29 Jul 2019 16:27:55 +0100
Message-Id: <20190729152755.11564-1-Liviu.Dudau@arm.com>
X-Mailer: git-send-email 2.22.0
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
Cc: Liviu Dudau <liviu.dudau@arm.com>, MaliDP Maintainers <malidp@foss.arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+CgpBZGQgdGhlIG5hbWVzIG9m
IHRoZSBrZXJuZWwgbW9kdWxlcyBmb3IgdGhlIEFybSBkaXNwbGF5IGRyaXZlcnMKc28gdGhhdCB0
ZXN0cyBpbnNpZGUgbGliRFJNIGNhbiBhdXRvLWRldGVjdCB0aGVpciBwcmVzZW5jZS4KClNpZ25l
ZC1vZmYtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgotLS0KIHRlc3RzL3V0
aWwva21zLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL3Rlc3RzL3V0aWwva21zLmMgYi90ZXN0cy91dGlsL2ttcy5jCmluZGV4IGRkMWJiZWUz
Li5kM2JlNmMwYyAxMDA2NDQKLS0tIGEvdGVzdHMvdXRpbC9rbXMuYworKysgYi90ZXN0cy91dGls
L2ttcy5jCkBAIC0xNDcsNiArMTQ3LDkgQEAgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBtb2R1
bGVzW10gPSB7CiAJInN0bSIsCiAJInN1bjRpLWRybSIsCiAJImFybWFkYS1kcm0iLAorCSJoZGxj
ZCIsCisJIm1hbGktZHAiLAorCSJrb21lZGEiLAogfTsKIAogaW50IHV0aWxfb3Blbihjb25zdCBj
aGFyICpkZXZpY2UsIGNvbnN0IGNoYXIgKm1vZHVsZSkKLS0gCjIuMjIuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
