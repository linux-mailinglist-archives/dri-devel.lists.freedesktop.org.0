Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 345AE14D4A3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 01:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804756F8BC;
	Thu, 30 Jan 2020 00:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6D56F8BC
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 00:24:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206347] amdgpu.dc=1 breaks power management on RX480 and others
Date: Thu, 30 Jan 2020 00:24:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: matare@fh-aachen.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-206347-2300-cOyH6ELZT1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206347-2300@https.bugzilla.kernel.org/>
References: <bug-206347-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDYzNDcKCi0tLSBD
b21tZW50ICMzIGZyb20gVmljdG9yIE1hdGFyw6kgKG1hdGFyZUBmaC1hYWNoZW4uZGUpIC0tLQpD
cmVhdGVkIGF0dGFjaG1lbnQgMjg3MDI5CiAgLS0+IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9y
Zy9hdHRhY2htZW50LmNnaT9pZD0yODcwMjkmYWN0aW9uPWVkaXQKZG1lc2cKCmRtZXNnIGZyb20g
YSBsb25nZXIgc2Vzc2lvbiB3aXRoIGF0IGxlYXN0IG9uZSBzdXNwZW5kL3Jlc3VtZSBjeWNsZS4g
VGhvc2UgR1BVCmZhdWx0cyBhdCB0aGUgZW5kIHdlcmUgdHJpZ2dlcmVkIGJ5IHBsYXlpbmcgQ2l2
aWxpemF0aW9uIDYsIGJ1dCBJIG5vdGljZWQKbm90aGluZyBvZiB0aGVtLiBUaGUgZ2FtZSBydW5z
IGZpbmUsIGkuZS4gbm8gY3Jhc2hlcywgZ2xpdGNoZXMgb3Igc3R1dHRlcnMuCgotLSAKWW91IGFy
ZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2ln
bmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
