Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAB5A0DA5
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 00:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFBB897C3;
	Wed, 28 Aug 2019 22:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF14897C3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 22:34:37 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204725] black screen
Date: Wed, 28 Aug 2019 22:34:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: drjoms@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204725-2300-ZvYFHFpzIs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204725-2300@https.bugzilla.kernel.org/>
References: <bug-204725-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ3MjUKCi0tLSBD
b21tZW50ICMyIGZyb20gRG1pdHJpIFNlbGV0c2tpIChkcmpvbXNAZ21haWwuY29tKSAtLS0KaSBj
YW4gY29ubmVjdCB0byBtYWNoaW5lIG92ZXIgc3NoLCBpdCdzIGhvdyBpIGtub3cgbWFjaGluZSBp
cyByZXNwb25zaXZlLgphdHRlbXB0cyB0byBzdGFydHggeG9yZyBmYWlsIHdpdGggY2hhbmdpbmcg
YmxhY2sgc2NyZWVuIHRvIGJsYWNrIHNjcmVlbi4KYWZ0ZXIgd2hpY2gga2V5Ym9hcmQgYmVjb21l
cyB1bnJlc3BvbnNpdmUsIHVudGlsIGkgcmFpc2Ugc2tpbm55IGVsZXBoYW50cy4oUi9TCmFuZCBp
IHJlZ2FpbiBjb250cm9sbCBvZiBrZXlib2FyZCkKCnNldCB1cCBuZXZlciB3b3JrZWQgd2l0aCAy
ZC8zZCBhY2NlbGVyYXRpb24sIGJ1dCB2aWRlbyBjYXJkIGlzIHRvbyBuZXcgdG8gYmUKdGVzdGVk
LiBDYXJkIHNlZW1zIHRvIGJlIGluIHdvcmtpbmcgY29uZGl0aW9ucywgYXMgaXQgd29ya3MgaW4g
VkVTQSBtb2RlLgoKY2hhbmdpbmcga2VybmVsIHZlcnNpb24gdG8gNS4zIGZhaWxzIFZFU0EgZmFp
bG92ZXIgb2YgWG9yZy4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToK
WW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
