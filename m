Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BE0CF94B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 14:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B676E1D5;
	Tue,  8 Oct 2019 12:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF906E1D5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 12:07:49 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204885] ryzen 2500U cause graphics glitch in all browsers with
 kernel version 5.2.x+
Date: Tue, 08 Oct 2019 12:07:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Other
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre-eric.pelloux-prayer@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204885-2300-XQojqTuylK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204885-2300@https.bugzilla.kernel.org/>
References: <bug-204885-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: mail.kernel.org; dkim=permerror (bad
 message/signature format)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ4ODUKClBpZXJy
ZS1FcmljIFBlbGxvdXgtUHJheWVyIChwaWVycmUtZXJpYy5wZWxsb3V4LXByYXllckBhbWQuY29t
KSBjaGFuZ2VkOgoKICAgICAgICAgICBXaGF0ICAgIHxSZW1vdmVkICAgICAgICAgICAgICAgICAg
ICAgfEFkZGVkCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICAgICAgICAgICAgICAgICBDQ3wgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfHBpZXJyZS1lcmljLnBlbGxvdXgtcHJheWVyQAogICAgICAg
ICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8YW1kLmNvbQoKLS0tIENv
bW1lbnQgIzQgZnJvbSBQaWVycmUtRXJpYyBQZWxsb3V4LVByYXllciAocGllcnJlLWVyaWMucGVs
bG91eC1wcmF5ZXJAYW1kLmNvbSkgLS0tClRoaXMgYnVnIGxvb2tzIHNpbWlsYXIgdG8gaHR0cHM6
Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTExMTIyCgpDb3VsZCB5b3Ug
dHJ5IHRoZSB2YXJpb3VzIHdvcmthcm91bmRzIHByb3Bvc2VkIHRoZXJlIGFuZCBzZWUgaWYgaXQg
aGVscHM6CiAgLSBhZGRpbmcgdGhlIGlvbW11PXB0IGtlcm5lbCBib290IHBhcmFtZXRlciAoc2Vl
Cmh0dHBzOi8vd2lraS5hcmNobGludXgub3JnL2luZGV4LnBocC9rZXJuZWxfcGFyYW1ldGVycyNH
UlVCKQogIC0gb3IgdXNpbmcgdGhlIEFNRF9ERUJVRz1ub2RjYyBlbnZpcm9ubWVudCB2YXJpYWJs
ZSAoZm9yIGluc3RhbmNlLCB0cnkgYWRkaW5nCmEgbmV3IGxpbmUgd2l0aCAiQU1EX0RFQlVHPW5v
ZGNjIiBpbiB0aGUgL2V0Yy9lbnZpcm9ubWVudCBmaWxlIGFuZCByZWJvb3QpCiAgLSBvciB1cGRh
dGluZyBNZXNhIHRvIHRoZSBsYXRlc3QgdmVyc2lvbgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRo
aXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVn
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
