Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 056A41491F8
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2020 00:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE1C6E4FF;
	Fri, 24 Jan 2020 23:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD526E4FF
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 23:24:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206299] New: [nouveau/xen] RTX 20XX instant reboot
Date: Fri, 24 Jan 2020 23:24:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-206299-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDYyOTkKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA2Mjk5CiAgICAgICAgICAgU3VtbWFyeTogW25vdXZlYXUveGVuXSBS
VFggMjBYWCBpbnN0YW50IHJlYm9vdAogICAgICAgICAgIFByb2R1Y3Q6IERyaXZlcnMKICAgICAg
ICAgICBWZXJzaW9uOiAyLjUKICAgIEtlcm5lbCBWZXJzaW9uOiA1LjQuWAogICAgICAgICAgSGFy
ZHdhcmU6IHg4Ni02NAogICAgICAgICAgICAgICAgT1M6IExpbnV4CiAgICAgICAgICAgICAgVHJl
ZTogTWFpbmxpbmUKICAgICAgICAgICAgU3RhdHVzOiBORVcKICAgICAgICAgIFNldmVyaXR5OiBi
bG9ja2luZwogICAgICAgICAgUHJpb3JpdHk6IFAxCiAgICAgICAgIENvbXBvbmVudDogVmlkZW8o
RFJJIC0gbm9uIEludGVsKQogICAgICAgICAgQXNzaWduZWU6IGRyaXZlcnNfdmlkZW8tZHJpQGtl
cm5lbC1idWdzLm9zZGwub3JnCiAgICAgICAgICBSZXBvcnRlcjogZnJlZGVyaWMuZXBpdHJlQG9y
YW5nZS5mcgogICAgICAgIFJlZ3Jlc3Npb246IE5vCgpDcmVhdGVkIGF0dGFjaG1lbnQgMjg2OTYz
CiAgLS0+IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9hdHRhY2htZW50LmNnaT9pZD0yODY5
NjMmYWN0aW9uPWVkaXQKS2VybmVsIGxvZwoKSGksCk9uIHNldmVyYWwga2VybmVscyA0LjE5Llgg
YW5kIDUuMy5YIG9yIGxhdGVzdCBvbmUgNS40LCBJJ20gaGF2aW5nIGFuIGlzc3VlIHdpdGgKYSBO
VklESUEgUlRYIDIwODBUSSAoYWxzbyByZXBvcnRlZCBieSBhbm90aGVyIHVzZXIgd2l0aCBSVFgg
MjA3MApodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2ZvcnVtLyMhbXNnL3F1YmVzLWRldmVsL296
T1FyT0hzVUJRL1h0SVFzR20zRGdBSikKY2F1c2luZyBsb3Qgb2YgaW5zdGFudCByZWJvb3RzIG9m
IG1hY2hpbmUuIFNwZWNpZmljYWxseSwgdGhlIGRpc3RyaWJ1dGlvbiBpcwpRdWJlcyBPUyBzbyBY
ZW4gaXMgdW5kZXIgdGhlIGhvb2QuIE9uIGEgY2xhc3NpY2FsIEZlZG9yYSAzMSBsaXZlY2QgSSBk
b24ndApzdWNjZWVkZWQgdG8gcmVwcm9kdWNlIHRoZSBjcmFzaCB3aGljaCBpcyBlYXNpbHkgcmVw
cm9kdWNpYmxlIGluIFF1YmVzIChlLmcuCm1hc3NpdmUgYW5kIGludGVuc2l2ZSByZXNpemUgb2Yg
d2luZG93cykuCgpUaGFua3MgdG8gdGhlIGhlbHAgb2YgTWFyZWsgTWFyY3p5a293c2tpLUfDs3Jl
Y2tpLCBJIG9idGFpbmVkIHRoZSBmb2xsb3dpbmcKYXR0YWNoZWQga2VybmVsIGxvZyB1c2luZyBu
ZXRjb25zb2xlLgoKQW55IGhlbHAgd291bGQgYmUgdmVyeSBhcHByZWNpYXRlZC4KCkZyw6lkw6ly
aWMgUGllcnJldAoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3Ug
YXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
