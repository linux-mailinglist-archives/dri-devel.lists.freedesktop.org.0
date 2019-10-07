Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB8DCDA97
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 05:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253E86E446;
	Mon,  7 Oct 2019 03:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8EE6E446
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 03:16:20 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Mon, 07 Oct 2019 03:16:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-6tF0DVo5tx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUwODkKCkFsZXgg
RGV1Y2hlciAoYWxleGRldWNoZXJAZ21haWwuY29tKSBjaGFuZ2VkOgoKICAgICAgICAgICBXaGF0
ICAgIHxSZW1vdmVkICAgICAgICAgICAgICAgICAgICAgfEFkZGVkCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KICAgICAgICAgICAgICAgICBDQ3wgICAgICAgICAgICAgICAgICAgICAgICAgICAgfGFsZXhk
ZXVjaGVyQGdtYWlsLmNvbQoKLS0tIENvbW1lbnQgIzEgZnJvbSBBbGV4IERldWNoZXIgKGFsZXhk
ZXVjaGVyQGdtYWlsLmNvbSkgLS0tClRoZSBHUFUgaGFzIHJlc2V0IGFuZCBzbyB5b3UgbmVlZCB0
byByZXN0YXJ0IHlvdXIgZGVza3RvcCBlbnZpcm9ubWVudCB0bwpjb250aW51ZS4gIFRoZSBlcnJv
ciBtZXNzYWdlcyBhcmUgYmVjYXVzZSB0aGUga2VybmVsIGlzIHJlamVjdGluZyBjb21tYW5kcyBm
cm9tCnVzZXJzcGFjZSBiZWNhdXNlIHRoZSBhcHBsaWNhdGlvbiBuZWVkcyB0byByZWNyZWF0ZSB0
aGVpciBjb250ZXh0cyBhZnRlciBhIEdQVQpyZXNldC4gIFRoaW5ncyBsaWtlIGRlc2t0b3AgY29t
cG9zaXRvcnMgd291bGQgbmVlZCB0byB1c2UgdGhlIE9wZW5HTCByb2J1c3RuZXNzCmV4dGVuc2lv
bnMgYW5kIHJlY3JlYXRlIHRoZWlyIGNvbnRleHRzIGFmdGVyIGEgR1BVIHJlc2V0IGZvciB0aGlz
IHRvIHdvcmsKc21vb3RobHkuICBVbmZvcnR1bmF0ZWx5LCBubyBkZXNrdG9wIGNvbXBvc2l0b3Jz
IGRvIHRoaXMgYXQgdGhlIG1vbWVudC4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwg
YmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
