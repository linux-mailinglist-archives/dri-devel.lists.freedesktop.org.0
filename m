Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA3DA4669
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2019 00:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CF46E14B;
	Sat, 31 Aug 2019 22:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4A96E14B
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2019 22:03:46 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204725] black screen
Date: Sat, 31 Aug 2019 22:03:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: untaintableangel@hotmail.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204725-2300-meXkQy8oko@https.bugzilla.kernel.org/>
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
b21tZW50ICMyMyBmcm9tIEFudCAodW50YWludGFibGVhbmdlbEBob3RtYWlsLmNvLnVrKSAtLS0K
QXMganVzdGlmaWNhdGlvbiBmb3IgbXkgbGFjayBvZiBmcmFtZWJ1ZmZlciBzdXBwb3J0IGluIHRo
ZSBrZXJuZWwsIGFsbG93IG1lIHRvCmRpcmVjdCB5b3UgdG8gdGhpcyBmcm9tIHRoZSBnZW50b28g
d2lraToKClRoZSBmcmFtZWJ1ZmZlcidzIG9yaWdpbmFsIGZ1bmN0aW9uIGlzIGFzIGEgdmlkZW8g
UkFNIGNhY2hlIHRvIGFsbG93IG1vcmUKZmxleGliaWxpdHkgdG8gKG9sZGVyKSB2aWRlbyBjYXJk
cy4gTWFueSBuZXdlciBjYXJkcyBjb21lIHdpdGggZnJhbWVidWZmZXJzIG9uCmJvYXJkLCB3aGlj
aCBhcmUgb2Z0ZW4gYWxyZWFkeSBjb21wYXRpYmxlIHdpdGggbWFueSBvcGVyYXRpbmcgc3lzdGVt
cy4gRW5hYmxpbmcKZnJhbWVidWZmZXIgc3VwcG9ydCBpbiB0aGUgTGludXgga2VybmVsIHdpbGwg
b2Z0ZW4gY2F1c2UgZ3JhcGhpY2FsIGFydGlmYWN0cyBvcgpibGFjayBzY3JlZW4gZGlzcGxheXMu
IEZvciBtb3N0IG5ld2VyIGNhcmRzLCB0aGlzIG9wdGlvbiBzaG91bGQgbm90IGJlIHNlbGVjdGVk
CndoZW4gdXNpbmcgdGhlIExpdmVEVkQuCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWls
IGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
