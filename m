Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C04646F3D9
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jul 2019 17:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A287989B42;
	Sun, 21 Jul 2019 15:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8FE89B42
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 15:08:16 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 666E32838B
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 15:08:16 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 5AA6828488; Sun, 21 Jul 2019 15:08:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201847] nouveau 0000:01:00.0: fifo: fault 01 [WRITE] at
 000000000a721000 engine 00 [GR] client 0f [GPC0/PROP_0] reason 82 [] on
 channel 4 [00ff85c000 X[3819]]
Date: Sun, 21 Jul 2019 15:08:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hcoin@quietfountain.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201847-2300-PwbxMFQg6x@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201847-2300@https.bugzilla.kernel.org/>
References: <bug-201847-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDE4NDcKCkhhcnJ5
IENvaW4gKGhjb2luQHF1aWV0Zm91bnRhaW4uY29tKSBjaGFuZ2VkOgoKICAgICAgICAgICBXaGF0
ICAgIHxSZW1vdmVkICAgICAgICAgICAgICAgICAgICAgfEFkZGVkCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KICAgICAgICAgICAgICAgICBDQ3wgICAgICAgICAgICAgICAgICAgICAgICAgICAgfGhjb2lu
QHF1aWV0Zm91bnRhaW4uY29tCgotLS0gQ29tbWVudCAjMiBmcm9tIEhhcnJ5IENvaW4gKGhjb2lu
QHF1aWV0Zm91bnRhaW4uY29tKSAtLS0KSGVyZSdzIGFub3RoZXIgZnJlZXplIHJlcG9ydDoKRnJv
bQokIHVuYW1lIC1hCkxpbnV4IGNlbzFob21lbnggNS4yLjAtOC1nZW5lcmljICM5LVVidW50dSBT
TVAgTW9uIEp1bCA4IDEzOjA3OjI3IFVUQyAyMDE5Cng4Nl82NCB4ODZfNjQgeDg2XzY0IEdOVS9M
aW51eApqdXN0IGJlZm9yZSBsb2NrIHN5c2xvZzoKCkp1bCAyMSAwOTo0NToyMCBjZW8xaG9tZW54
IGtlcm5lbDogWzg5ODQ5LjkxOTQ5MF0gbm91dmVhdSAwMDAwOjAxOjAwLjA6IGZpZm86ClNDSEVE
X0VSUk9SIDBhIFtDVFhTV19USU1FT1VUXQpKdWwgMjEgMDk6NDU6MjAgY2VvMWhvbWVueCBrZXJu
ZWw6IFs4OTg0OS45MTk1MDBdIG5vdXZlYXUgMDAwMDowMTowMC4wOiBmaWZvOgpydW5saXN0IDA6
IHNjaGVkdWxlZCBmb3IgcmVjb3ZlcnkKSnVsIDIxIDA5OjQ1OjIwIGNlbzFob21lbngga2VybmVs
OiBbODk4NDkuOTE5NTA2XSBub3V2ZWF1IDAwMDA6MDE6MDAuMDogZmlmbzoKY2hhbm5lbCA4OiBr
aWxsZWQKSnVsIDIxIDA5OjQ1OjIwIGNlbzFob21lbngga2VybmVsOiBbODk4NDkuOTE5NTExXSBu
b3V2ZWF1IDAwMDA6MDE6MDAuMDogZmlmbzoKZW5naW5lIDA6IHNjaGVkdWxlZCBmb3IgcmVjb3Zl
cnkKSnVsIDIxIDA5OjQ1OjIwIGNlbzFob21lbngga2VybmVsOiBbODk4NDkuOTE5ODE1XSBub3V2
ZWF1IDAwMDA6MDE6MDAuMDoKWG9yZ1sxNTQ2XTogY2hhbm5lbCA4IGtpbGxlZCEKLS0gaGFyZCBs
b2NrIC0tCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUg
d2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
