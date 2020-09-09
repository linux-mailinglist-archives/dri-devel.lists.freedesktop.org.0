Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2302F262D9C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 13:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C456EE2F;
	Wed,  9 Sep 2020 11:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E92F6EE2F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 11:03:55 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209163] amdgpu: The CS has been cancelled because the context
 is lost
Date: Wed, 09 Sep 2020 11:03:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Memory Management
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: christian.koenig@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209163-2300-ThDpFFVbwc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209163-2300@https.bugzilla.kernel.org/>
References: <bug-209163-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDkxNjMKCi0tLSBD
b21tZW50ICM0IGZyb20gQ2hyaXN0aWFuIEvDtm5pZyAoY2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
KSAtLS0KVGhpcyBpcyBleHBlY3RlZCBiZWhhdmlvciwgeW91ciBhcHBsaWNhdGlvbiB0cmllcyB0
byB1c2UgbW9yZSBtZW1vcnkgdGhhbgpwaHlzaWNhbCBhdmFpbGFibGU6CgpbNzE4MDQuOTMwMDAz
XSBbZHJtOmFtZGdwdV9jc19pb2N0bCBbYW1kZ3B1XV0gKkVSUk9SKiBOb3QgZW5vdWdoIG1lbW9y
eSBmb3IKY29tbWFuZCBzdWJtaXNzaW9uIQoKVGhhdCBpcyBtb3N0IGxpa2VseSBhIGJ1ZyBpbiB0
aGUgYXBwbGljYXRpb24sIGUuZy4gYSBtZW1vcnkgbGVhay4KCi0tIApZb3UgYXJlIHJlY2Vpdmlu
ZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhl
IGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
