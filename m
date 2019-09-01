Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1378A4B27
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2019 20:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9385689812;
	Sun,  1 Sep 2019 18:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4197989812
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2019 18:28:02 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204725] black screen
Date: Sun, 01 Sep 2019 18:28:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: Dieter@nuetzel-hh.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204725-2300-GWVlkooKsr@https.bugzilla.kernel.org/>
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
b21tZW50ICM0MyBmcm9tIERpZXRlciBOw7x0emVsIChEaWV0ZXJAbnVldHplbC1oaC5kZSkgLS0t
CihJbiByZXBseSB0byBEaWV0ZXIgTsO8dHplbCBmcm9tIGNvbW1lbnQgIzQyKQo+IChJbiByZXBs
eSB0byBEbWl0cmkgU2VsZXRza2kgZnJvbSBjb21tZW50ICMyOCkKPiA+IChJbiByZXBseSB0byBB
bnQgZnJvbSBjb21tZW50ICMyMikKPiAKPiBbLV0KPiAKPiA+IGxvb2sgYXQgbXkgbWVzc2FnZSBh
dCAnMjAxOS0wOC0zMSAyMTowOTo0NSBVVEMnCj4gPiBmb3IgYW5zd2VyIG9uIHdoYXRzIGluIG15
IGNvbmZpZyBmaWxlCj4gPiAKPiA+IHNlZSBYb3JnIG91dHB1dCBhdHRhY2hlZCBpbiBuZXh0IG1l
c3NhZ2UuCj4gPiAKPiA+IAo+ID4gJ2FnZDVmJ3MgYW1kLXN0YWdpbmcgYnJhbmNoJyAtIGkgd2ls
bCB0cnkgdG8gZmluZCBpdC4KPiA+IG15IG5leHQgc3RlcCBpcyB0byBjb21waWxlIExMVk0gOSh0
aG91Z2ggbWVzc2FnZSBhYm91dCB2ZXJzaW9uIG9mIExMVk0KPiBzZWVtcwo+ID4gc3RhdGljLCBv
ciBzbyBJIHN1c3BlY3QpCj4gPiAKPiA+IAo+ID4gYWdhaW4sIGZyaWVuZGx5IHJlbWFpbmRlciB0
byBldmVyeW9uZSByZWFkaW5nLiBQcm9ibGVtcyBoYXBwZW5zIEJFRk9SRQo+IHhvcmcsCj4gPiBp
dCBoYXBwZW5zIGF0IG1vbWVudCB3aGVuIGFtZGdwdSBkcml2ZXIgaXMgbG9hZGVkLgo+IAo+IEhl
bGxvLAo+IAo+IEkndmUgZm91bmQgcmVncmVzc2lvbiAoYmxhY2svYmxhbmsgc2NyZWVuICkgZXZl
biBvbiBQb2xhcmlzIDIwIChSWDU4MCkgaW4KPiBjdXJyZW50ICdhbWQtc3RhZ2luZy1kcm0tbmV4
dCcgLSBjb21taXQgIzM5MTNjYzhjZGNmMwo+IAo+IExhdGVzdCB3b3JraW5nIGNvbW1pdCB3YXMg
I2MzODlmMTk4MGNiYgo+IAo+IEJpc2VjdGluZywgbm93LgoKT0ssIHRoZXkgcHVsbGVkIHNvbWUg
Y29tbWl0cyBiYWNrLgoKQ3VycmVudCAnYW1kLXN0YWdpbmctZHJtLW5leHQnIGlzIFdPUktJTkcg
YXQgbGVhc3QgZm9yIG1lIChQb2xhcmlzIDIwKSwgYWdhaW4uCgpCVFcKWW91IGNhbiBmaW5kIGl0
LCBoZXJlOgpodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9saW51eC9sb2cvP2g9
YW1kLXN0YWdpbmctZHJtLW5leHQKCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVj
YXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
