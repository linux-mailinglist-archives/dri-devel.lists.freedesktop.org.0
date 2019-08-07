Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1118455B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E645D6E36B;
	Wed,  7 Aug 2019 07:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6A96E36B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 07:10:18 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id F4010289B2
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 07:10:17 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id E8680289AF; Wed,  7 Aug 2019 07:10:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203781] AMDGPU Radeon VII crashes with dual monitors
Date: Wed, 07 Aug 2019 07:10:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: steffen@vexar.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203781-2300-0JgLHs8hVP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203781-2300@https.bugzilla.kernel.org/>
References: <bug-203781-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDM3ODEKClN0ZWZm
ZW4gU2NocsO2dGVyIChzdGVmZmVuQHZleGFyLmRlKSBjaGFuZ2VkOgoKICAgICAgICAgICBXaGF0
ICAgIHxSZW1vdmVkICAgICAgICAgICAgICAgICAgICAgfEFkZGVkCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KICAgICAgICAgICAgICAgICBDQ3wgICAgICAgICAgICAgICAgICAgICAgICAgICAgfHN0ZWZm
ZW5AdmV4YXIuZGUKCi0tLSBDb21tZW50ICMzIGZyb20gU3RlZmZlbiBTY2hyw7Z0ZXIgKHN0ZWZm
ZW5AdmV4YXIuZGUpIC0tLQpJIGNhbiBjb25maXJtIHRoaXMgYnVnLCB1c2luZyBrZXJuZWxzIDUu
MSBvciBoaWdoZXIgd2l0aCB0d28gRFAgbW9uaXRvcnMKY29ubmVjdGVkIGxlYXZlcyBtZSB1bmFi
bGUgdG8gYm9vdC4gRGlzY29ubmVjdGluZyBvbmUgbW9uaXRvciBtYWtlcyBpdCB3b3JrIGFzCmV4
cGVjdGVkLgoKSWYgaSBib290IHdpdGggYSBzaW5nbGUgbW9uaXRvciBhbmQgdGhlbiBwbHVnIGlu
IHRoZSBzZWNvbmQgb25lIGFmdGVyIGJvb3RpbmcKdGhlIHN5c3RlbSBjcmFzaGVzIHdpdGggZ3Jh
cGhpY2FsIGNvcnJ1cHRpb24uCgpPbiBvbGRlciBrZXJuZWxzIGV2ZXJ5dGhpbmcgd29ya3MgZmlu
ZS4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRj
aGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
