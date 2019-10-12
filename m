Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3CBD4EAC
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2019 11:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708DC6E479;
	Sat, 12 Oct 2019 09:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638E36E479
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 09:40:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205049] garbled graphics
Date: Sat, 12 Oct 2019 09:40:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lechp@onet.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205049-2300-26R8uvcHcC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205049-2300@https.bugzilla.kernel.org/>
References: <bug-205049-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUwNDkKCi0tLSBD
b21tZW50ICM5IGZyb20gbGVjaHBAb25ldC5wbCAtLS0KS2VybmVsIDUuMi4xOCBoYXMgdGhlIHNh
bWUgcHJvYmxlbS4gV2hhdCdzIGdvaW5nIG9uPwoKSSd2ZSBhbHJlYWR5IGluY3JlYXNlZCB0aGUg
ZGVmYXVsdCBudW1iZXIgb2Ygb2xkIGtlcm5lbHMgdGhhdCBhcmUga2VwdCBieSBncnViLApmcm9t
IDMgdG8gNSwgYnV0IGF0IHRoaXMgcmF0ZSwgSSdtIGdvaW5nIHRvIGhhdmUgdG8gZWl0aGVyIGlu
Y3JlYXNlIGl0IGFnYWluLApvciBzdG9wIHVwZGF0aW5nLiBUaGUgbGFzdCAndXNhYmxlJyBrZXJu
ZWwgKHZlcnNpb24gNS4xLjIwLTIwMCkgaGFzIG90aGVyCnByb2JsZW1zIHRvbywgaW5jbHVkaW5n
IHVuZXhwbGFpbmVkIGZyZWV6aW5nIG9uY2Ugb3IgdHdpY2UgYSBkYXksIGFuZCB3aWZpIHRoYXQK
J3NvbWV0aW1lcycgc3RvcHMgd29ya2luZyBhZnRlciByZXN1bWluZyBmcm9tIHNsZWVwLgoKVGhl
c2UgYXJlIGFsbCByZWdyZXNzaW9ucyBmcm9tIHllYXJzIGFnby4KCi0tIApZb3UgYXJlIHJlY2Vp
dmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2Yg
dGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
