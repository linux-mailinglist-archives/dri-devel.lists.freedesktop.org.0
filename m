Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F09DC94A0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 01:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968736E15E;
	Wed,  2 Oct 2019 23:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F05D6E15E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 23:10:43 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205069] Black screen when starting graphical environment
Date: Wed, 02 Oct 2019 23:10:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: freddyreimer@comcast.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-205069-2300-UZTTXuxQFb@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUwNjkKCmZyZWRk
eXJlaW1lckBjb21jYXN0Lm5ldCBjaGFuZ2VkOgoKICAgICAgICAgICBXaGF0ICAgIHxSZW1vdmVk
ICAgICAgICAgICAgICAgICAgICAgfEFkZGVkCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICAgICAgICAg
ICAgIFN0YXR1c3xORVcgICAgICAgICAgICAgICAgICAgICAgICAgfFJFU09MVkVECiAgICAgICAg
IFJlc29sdXRpb258LS0tICAgICAgICAgICAgICAgICAgICAgICAgIHxQQVRDSF9BTFJFQURZX0FW
QUlMQUJMRQoKLS0tIENvbW1lbnQgIzcgZnJvbSBmcmVkZHlyZWltZXJAY29tY2FzdC5uZXQgLS0t
CkdvdGNoYS4gSSBkaWQgbm90IGtub3cgdW50aWwgdmVyeSByZWNlbnRseSB0aGF0IHRoZSBncmFw
aGljcyBvdXRwdXQgZm9yIHRoaXMKa2VybmVsIG5hdmkgZHJpdmVyIHJlcXVpcmVkIGEgc3BlY2lm
aWMgc2V0IG9mIHVzZXJsYW5kIGxpYnJhcmllcyB0byBleGlzdC4gSQpyZWNvbXBpbGVkIG1lc2Eg
YW5kIGFsc28gZ290IG9udG8gYSBuZXcgdmVyc2lvbiBvZiBsbHZtLWNvbW1vbiBmb3IgZ29vZApt
ZWFzdXJlLgoKVGhpcyB3b3JrZWQhIFRoYW5rIHlvdSBmb3IgeW91ciBoZWxwISBJIGFtIGFibGUg
dG8gbGF1bmNoIFhvcmcgb24gQU1ER1BVCmRyaXZlciwgd2l0aG91dCByZXNvcnRpbmcgdG8gdmVz
YSwgYW5kIGNhbiBhbHNvIHJ1biBTd2F5IHdtLiBObyBkaXNwbGF5CmZyZWV6aW5nIG9yIGFueXRo
aW5nIGxpa2UgdGhhdC4gSSdsbCBzZXQgdGhpcyBhcyByZXNvbHZlZC4KClJlbWluZGVyIGZvciBm
dXR1cmUgcmVmZXJlbmNlIGlmIHNvbWVvbmUgY29tZXMgYWNyb3NzIHRoaXMgd2l0aCB0aGUgc2Ft
ZSBpc3N1ZS4KWW91IG5lZWQgYXQgbWluaW11bSBMTFZNIDkgYW5kIE1lc2EgMTkuMi4wLiBUaGUg
TExWTSBoYXMgdG8gYmUgaW5zdGFsbGVkIGZpcnN0LgoKVGhhbmsgeW91IGFnYWluLgoKLS0gCllv
dSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBh
c3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
