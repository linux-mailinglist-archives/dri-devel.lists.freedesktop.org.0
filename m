Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CEDC4247
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 23:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6636E89B;
	Tue,  1 Oct 2019 21:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C4A6E89B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 21:03:58 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205069] Black screen when starting graphical environment
Date: Tue, 01 Oct 2019 21:03:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: freddyreimer@comcast.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205069-2300-gJ0blXju6c@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205069-2300@https.bugzilla.kernel.org/>
References: <bug-205069-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUwNjkKCi0tLSBD
b21tZW50ICM1IGZyb20gZnJlZGR5cmVpbWVyQGNvbWNhc3QubmV0IC0tLQpJJ3ZlIHNlZW4gYW5v
dGhlciByZXBvcnQgb24gYSBzaW1pbGFyIGlzc3VlLCB3aGVyZSB0aGUgc3VnZ2VzdGlvbiAoc29s
dXRpb24/KQp3YXMgdG8gYmUgdXNpbmcgYSBuZXdlciBtZXNhIGFuZCBsbHZtLiBJIGFtIG9uIGxs
dm0gOSBhbmQgbWVzYSAxOS4yLjAKCgoqICBtZWRpYS1saWJzL21lc2EKICAgICAgTGF0ZXN0IHZl
cnNpb24gYXZhaWxhYmxlOiAxOS4yLjAKICAgICAgTGF0ZXN0IHZlcnNpb24gaW5zdGFsbGVkOiAx
OS4yLjBfcmM0CgoqICBzeXMtZGV2ZWwvbGx2bQogICAgICBMYXRlc3QgdmVyc2lvbiBhdmFpbGFi
bGU6IDkuMC4wCiAgICAgIExhdGVzdCB2ZXJzaW9uIGluc3RhbGxlZDogOS4wLjAKCi0tIApZb3Ug
YXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNz
aWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
