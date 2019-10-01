Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66564C420B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 22:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A02D6E893;
	Tue,  1 Oct 2019 20:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC81D6E893
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 20:53:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205069] New: Black screen when starting graphical environment
Date: Tue, 01 Oct 2019 20:53:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-205069-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUwNjkKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA1MDY5CiAgICAgICAgICAgU3VtbWFyeTogQmxhY2sgc2NyZWVuIHdo
ZW4gc3RhcnRpbmcgZ3JhcGhpY2FsIGVudmlyb25tZW50CiAgICAgICAgICAgUHJvZHVjdDogRHJp
dmVycwogICAgICAgICAgIFZlcnNpb246IDIuNQogICAgS2VybmVsIFZlcnNpb246IDUuMy4xLCA1
LjQuMC1yYzEsIGxhdGVzdAogICAgICAgICAgSGFyZHdhcmU6IHg4Ni02NAogICAgICAgICAgICAg
ICAgT1M6IExpbnV4CiAgICAgICAgICAgICAgVHJlZTogTWFpbmxpbmUKICAgICAgICAgICAgU3Rh
dHVzOiBORVcKICAgICAgICAgIFNldmVyaXR5OiBoaWdoCiAgICAgICAgICBQcmlvcml0eTogUDEK
ICAgICAgICAgQ29tcG9uZW50OiBWaWRlbyhEUkkgLSBub24gSW50ZWwpCiAgICAgICAgICBBc3Np
Z25lZTogZHJpdmVyc192aWRlby1kcmlAa2VybmVsLWJ1Z3Mub3NkbC5vcmcKICAgICAgICAgIFJl
cG9ydGVyOiBmcmVkZHlyZWltZXJAY29tY2FzdC5uZXQKICAgICAgICBSZWdyZXNzaW9uOiBObwoK
Q3JlYXRlZCBhdHRhY2htZW50IDI4NTI4NQogIC0tPiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5v
cmcvYXR0YWNobWVudC5jZ2k/aWQ9Mjg1Mjg1JmFjdGlvbj1lZGl0Cmtlcm5lbCAuY29uZmlnIDUu
NC4wLXJjMQoKSGVsbG8gdGhlcmUKCk9uIGtlcm5lbHMgNS4zLjEgYW5kIDUuNC4wLXJjMSwgSSBn
ZXQgYSBibGFjayBzY3JlZW4gd2l0aCBhIHdoaXRlIHVuZGVyc2NvcmUKY3Vyc29yIGluIHRoZSB1
cHBlciBsZWZ0LiBUaGUgZGlzcGxheSBnZXRzIHN0dWNrIGluIHRoaXMgc3RhdGUsIHdpdGggbm8g
d2F5IHRvCnN3aXRjaCB0byBhIGRpZmZlcmVudCBUVFkgb3IgbGVhdmUgdGhpcyBhc2lkZSBmcm9t
IGhpdHRpbmcgdGhlIHJlc2V0IGJ1dHRvbi4KSSBjYW4gc2VjdXJlLXNoZWxsIGludG8gdGhlIGJv
eCBhbmQgZ2V0IGEgbG9naW4gYXQgdGhpcyB0aW1lLCBidXQga2lsbGluZyB0aGUKcHJvY2VzcyBk
b2VzIG5vdCBmaXggdGhlIGRpc3BsYXkuIFN3YXkgV00gYWxzbyBkb2VzIHRoaXMsIHdpdGggaXQg
anVzdCBnZXR0aW5nCnN0dWNrIGF0IHRoZSBwcm9tcHQgZW50cnkuCgpJIGhhdmUgYW4gQU1EIFJY
IDU3MDAgZ3JhcGhpY3MgY2FyZCwgdXNpbmcgdGhlIGFtZGdwdSBkcml2ZXIuIFdoZW4gSSBkbyBz
b21lCm1hbnVhbCBjb25maWd1cmF0aW9uIGJ5IGJsYWNrbGlzdGluZyBhbWRncHUgYW5kIHdyaXRp
bmcgYSBzdGFuemEgaW4geG9yZyBjb25mCmZvciB2ZXNhLCBJIGFtIGFibGUgdG8gZ2V0IFggcnVu
bmluZyB1c2luZyB2ZXNhLgoKdW5hbWUgLWEgb3V0cHV0OiBMaW51eCBnZW50b28gNS40LjAtcmMx
ICMxIFNNUCBUdWUgT2N0IDEgMTQ6MjQ6NTcgRURUIDIwMTkKeDg2XzY0IEFNRCBSeXplbiA1IDM2
MDAgNi1Db3JlIFByb2Nlc3NvciBBdXRoZW50aWNBTUQgR05VL0xpbnV4CgotLSAKWW91IGFyZSBy
ZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVl
IG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
