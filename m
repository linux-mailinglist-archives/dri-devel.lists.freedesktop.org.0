Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3CA3300B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 14:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C811D89291;
	Mon,  3 Jun 2019 12:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3E989272;
 Mon,  3 Jun 2019 12:44:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 05:44:31 -0700
X-ExtLoop1: 1
Received: from linuxpresi1-desktop.iind.intel.com ([10.223.74.143])
 by orsmga004.jf.intel.com with ESMTP; 03 Jun 2019 05:44:28 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [v2 3/3] video/hdmi: Dropped static functions from kernel doc
Date: Mon,  3 Jun 2019 18:38:50 +0530
Message-Id: <1559567330-25182-4-git-send-email-uma.shankar@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559567330-25182-1-git-send-email-uma.shankar@intel.com>
References: <1559567330-25182-1-git-send-email-uma.shankar@intel.com>
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
Cc: jonas@kwiboo.se, emil.l.velikov@gmail.com,
 Uma Shankar <uma.shankar@intel.com>, seanpaul@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcHBlZCBzdGF0aWMgZnVuY3Rpb25zIGZyb20ga2VybmVsIGRvY3VtZW50YXRpb24uCgp2Mjog
RHJvcHBlZCB0aGUgY29tbWVudHMgYWx0b2dldGhlciBmb3Igc3RhdGljIGZ1bmN0aW9ucywKYXMg
dGhlIGRlZmluaXRpb25zIHNlZW1zIHNlbGYgZXhwbGFuYXRvcnkuCgpTdWdnZXN0ZWQtYnk6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogVW1hIFNoYW5rYXIg
PHVtYS5zaGFua2FyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2hkbWkuYyB8IDMwIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMwIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vaGRtaS5jIGIvZHJpdmVycy92aWRlby9o
ZG1pLmMKaW5kZXggYjk5YmEwMS4uYjkzOWJjMiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9o
ZG1pLmMKKysrIGIvZHJpdmVycy92aWRlby9oZG1pLmMKQEAgLTExOTEsMTIgKzExOTEsNiBAQCBz
dGF0aWMgY29uc3QgY2hhciAqaGRtaV9udXBzX2dldF9uYW1lKGVudW0gaGRtaV9udXBzIG51cHMp
CiAJcmV0dXJuICJJbnZhbGlkIjsKIH0KIAotLyoqCi0gKiBoZG1pX2F2aV9pbmZvZnJhbWVfbG9n
KCkgLSBsb2cgaW5mbyBvZiBIRE1JIEFWSSBpbmZvZnJhbWUKLSAqIEBsZXZlbDogbG9nZ2luZyBs
ZXZlbAotICogQGRldjogZGV2aWNlCi0gKiBAZnJhbWU6IEhETUkgQVZJIGluZm9mcmFtZQotICov
CiBzdGF0aWMgdm9pZCBoZG1pX2F2aV9pbmZvZnJhbWVfbG9nKGNvbnN0IGNoYXIgKmxldmVsLAog
CQkJCSAgIHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJCQkgICBjb25zdCBzdHJ1Y3QgaGRtaV9hdmlf
aW5mb2ZyYW1lICpmcmFtZSkKQEAgLTEyNjgsMTIgKzEyNjIsNiBAQCBzdGF0aWMgY29uc3QgY2hh
ciAqaGRtaV9zcGRfc2RpX2dldF9uYW1lKGVudW0gaGRtaV9zcGRfc2RpIHNkaSkKIAlyZXR1cm4g
IlJlc2VydmVkIjsKIH0KIAotLyoqCi0gKiBoZG1pX3NwZF9pbmZvZnJhbWVfbG9nKCkgLSBsb2cg
aW5mbyBvZiBIRE1JIFNQRCBpbmZvZnJhbWUKLSAqIEBsZXZlbDogbG9nZ2luZyBsZXZlbAotICog
QGRldjogZGV2aWNlCi0gKiBAZnJhbWU6IEhETUkgU1BEIGluZm9mcmFtZQotICovCiBzdGF0aWMg
dm9pZCBoZG1pX3NwZF9pbmZvZnJhbWVfbG9nKGNvbnN0IGNoYXIgKmxldmVsLAogCQkJCSAgIHN0
cnVjdCBkZXZpY2UgKmRldiwKIAkJCQkgICBjb25zdCBzdHJ1Y3QgaGRtaV9zcGRfaW5mb2ZyYW1l
ICpmcmFtZSkKQEAgLTE0MDQsMTIgKzEzOTIsNiBAQCBzdGF0aWMgdm9pZCBoZG1pX3NwZF9pbmZv
ZnJhbWVfbG9nKGNvbnN0IGNoYXIgKmxldmVsLAogCXJldHVybiAiUmVzZXJ2ZWQiOwogfQogCi0v
KioKLSAqIGhkbWlfYXVkaW9faW5mb2ZyYW1lX2xvZygpIC0gbG9nIGluZm8gb2YgSERNSSBBVURJ
TyBpbmZvZnJhbWUKLSAqIEBsZXZlbDogbG9nZ2luZyBsZXZlbAotICogQGRldjogZGV2aWNlCi0g
KiBAZnJhbWU6IEhETUkgQVVESU8gaW5mb2ZyYW1lCi0gKi8KIHN0YXRpYyB2b2lkIGhkbWlfYXVk
aW9faW5mb2ZyYW1lX2xvZyhjb25zdCBjaGFyICpsZXZlbCwKIAkJCQkgICAgIHN0cnVjdCBkZXZp
Y2UgKmRldiwKIAkJCQkgICAgIGNvbnN0IHN0cnVjdCBoZG1pX2F1ZGlvX2luZm9mcmFtZSAqZnJh
bWUpCkBAIC0xNDM3LDEyICsxNDE5LDYgQEAgc3RhdGljIHZvaWQgaGRtaV9hdWRpb19pbmZvZnJh
bWVfbG9nKGNvbnN0IGNoYXIgKmxldmVsLAogCQkJZnJhbWUtPmRvd25taXhfaW5oaWJpdCA/ICJZ
ZXMiIDogIk5vIik7CiB9CiAKLS8qKgotICogaGRtaV9kcm1faW5mb2ZyYW1lX2xvZygpIC0gbG9n
IGluZm8gb2YgSERNSSBEUk0gaW5mb2ZyYW1lCi0gKiBAbGV2ZWw6IGxvZ2dpbmcgbGV2ZWwKLSAq
IEBkZXY6IGRldmljZQotICogQGZyYW1lOiBIRE1JIERSTSBpbmZvZnJhbWUKLSAqLwogc3RhdGlj
IHZvaWQgaGRtaV9kcm1faW5mb2ZyYW1lX2xvZyhjb25zdCBjaGFyICpsZXZlbCwKIAkJCQkgICBz
dHJ1Y3QgZGV2aWNlICpkZXYsCiAJCQkJICAgY29uc3Qgc3RydWN0IGhkbWlfZHJtX2luZm9mcmFt
ZSAqZnJhbWUpCkBAIC0xNTAwLDEyICsxNDc2LDYgQEAgc3RhdGljIHZvaWQgaGRtaV9kcm1faW5m
b2ZyYW1lX2xvZyhjb25zdCBjaGFyICpsZXZlbCwKIAlyZXR1cm4gIlJlc2VydmVkIjsKIH0KIAot
LyoqCi0gKiBoZG1pX3ZlbmRvcl9pbmZvZnJhbWVfbG9nKCkgLSBsb2cgaW5mbyBvZiBIRE1JIFZF
TkRPUiBpbmZvZnJhbWUKLSAqIEBsZXZlbDogbG9nZ2luZyBsZXZlbAotICogQGRldjogZGV2aWNl
Ci0gKiBAZnJhbWU6IEhETUkgVkVORE9SIGluZm9mcmFtZQotICovCiBzdGF0aWMgdm9pZAogaGRt
aV92ZW5kb3JfYW55X2luZm9mcmFtZV9sb2coY29uc3QgY2hhciAqbGV2ZWwsCiAJCQkgICAgICBz
dHJ1Y3QgZGV2aWNlICpkZXYsCi0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
