Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6055149440
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2020 10:51:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC30D6E0C1;
	Sat, 25 Jan 2020 09:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DE46E0C1
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 09:51:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206299] [nouveau/xen] RTX 20XX instant reboot
Date: Sat, 25 Jan 2020 09:51:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: frederic.epitre@orange.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206299-2300-gI7FtLX0TC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206299-2300@https.bugzilla.kernel.org/>
References: <bug-206299-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDYyOTkKCi0tLSBD
b21tZW50ICMzIGZyb20gRnLDqWTDqXJpYyBQaWVycmV0IChmcmVkZXJpYy5lcGl0cmVAb3Jhbmdl
LmZyKSAtLS0KSGkgSWxpYSwKVGhhbmsgeW91IGZvciB5b3VyIGFuc3dlci4KCihJbiByZXBseSB0
byBJbGlhIE1pcmtpbiBmcm9tIGNvbW1lbnQgIzEpCj4gQ29tbWVudCBvbiBhdHRhY2htZW50IDI4
Njk2MyBbZGV0YWlsc10KPiBLZXJuZWwgbG9nCj4gCj4gYmFkZjUwNDAgPSBiYWQgbW1pbyByZWFk
Lgo+IAo+IENvdWxkIHRoZXJlIGJlIHNvbWUgUENJIHNpdHVhdGlvbj8gQ2FuIHlvdSBpbmNsdWRl
IGEgZnVsbCBib290IGxvZz8KCllvdSdsbCBmaW5kIGRtZXNnLmxvZyBhdHRhY2hlZC4gQnkgUENJ
IHNpdHVhdGlvbiB5b3UgbWVhbiBoYXJkd2FyZSBpc3N1ZT8gSWYKeWVzLCB0aGUgY2FyZCBpcyBu
b3JtYWxseSBmdW5jdGlvbmFsIHVuZGVyIFdpbmRvd3MuIEZvciB5b3VyIGluZm9ybWF0aW9uLCB0
aGUKR1BVIHJlbWFpbnMgYXR0YWNoZWQgdG8gZG9tMCwgbm90IHBjaS1wYXNzdGhyb3VnaGVkIG9u
IGEgZG9tVS4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFy
ZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
