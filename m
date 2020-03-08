Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2317917D5EE
	for <lists+dri-devel@lfdr.de>; Sun,  8 Mar 2020 20:51:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B755897EF;
	Sun,  8 Mar 2020 19:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A24389700
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2020 19:51:15 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id j16so7563159otl.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2020 12:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=h7mtvj3U8SX3F4DKw1SE8tkMR2yrXdUYfpdEWZY3kCM=;
 b=aL8Zz3WbjrjLQp8JLMgjAA38eLzMuU7g49s6izLg9RuZ0TUsV2S8e3w6YKsu7T2+Yw
 2ay6D70ax9+laIzVGCKOtMEWdk1weSvmKt9HYLYJuSxhZhi6//1Or/VUmB8UNnTilPgL
 ymD+hyvBBCroZad7mpldhSq0b9O8dsr39Jf1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=h7mtvj3U8SX3F4DKw1SE8tkMR2yrXdUYfpdEWZY3kCM=;
 b=Imd1u6kNbf6Hh8tNEt4JB1UfxTtTwCGc68LWA8L+NGro93jSDyCwlVmKN6Rjdp36Gz
 LKFZ7LjPD60EoN+uXBGNFANOOQcCOz8Jz2AqKR44xx3HM77lXbNlYLqBa2mKBo7zVXT8
 we+95U81un8NBC184WqOv257//iW7DscHiNXPILKq3CgLNObCEVaEqf8UftjUApVD2oH
 3wggEpOghcMt2AuoseRMbyuX1yDWu8uUiX6+Is/OvUKo5acH5lxeUpqxjwog2oXRZb+m
 C4J534FHOQZPrkCRx6OvHiV0q59tq9XMwy76FecvBdqkwMlo5Rnu0A8vDRKxEZk70DpO
 uhRQ==
X-Gm-Message-State: ANhLgQ3WgOZLdqsj2022jyTpb4Ixt4Ae0bTRlAvLiQijm/dla2IkmDIP
 L8OBvI/aNOZLbwwdNXg8/YWNN9wEFBgTJ6SfA574xg==
X-Google-Smtp-Source: ADFU+vsWjrFrZiRA/492o9qJtU+zFWY2XFnnTMx6oPim0T5rjdC+BKRoN7WlKZ4eIH1ArsGEV2OCiIKPsuEkZLbF/ww=
X-Received: by 2002:a9d:6c1:: with SMTP id 59mr11282008otx.281.1583697074264; 
 Sun, 08 Mar 2020 12:51:14 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sun, 8 Mar 2020 20:51:03 +0100
Message-ID: <CAKMK7uFO26eeXdr+Um+fwKO4_UvVHX-KueUt=x_omXOqDPhBZw@mail.gmail.com>
Subject: 2020 X.Org Board of Directors Elections Nomination period is NOW
To: Xorg Members List <members@x.org>
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
Cc: Mesa Dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgYXJlIHNlZWtpbmcgbm9taW5hdGlvbnMgZm9yIGNhbmRpZGF0ZXMgZm9yIGVsZWN0aW9uIHRv
IHRoZSBYLk9yZwpGb3VuZGF0aW9uIEJvYXJkIG9mIERpcmVjdG9ycy4gQWxsIFguT3JnIEZvdW5k
YXRpb24gbWVtYmVycyBhcmUKZWxpZ2libGUgZm9yIGVsZWN0aW9uIHRvIHRoZSBib2FyZC4KCk5v
bWluYXRpb25zIGZvciB0aGUgMjAyIGVsZWN0aW9uIGFyZSBub3cgb3BlbiBhbmQgd2lsbCByZW1h
aW4gb3Blbgp1bnRpbCAyMzo1OSBVVEMgb24gMjl0aCBNYXJjaCAyMDIwLgoKVGhlIEJvYXJkIGNv
bnNpc3RzIG9mIGRpcmVjdG9ycyBlbGVjdGVkIGZyb20gdGhlIG1lbWJlcnNoaXAuIEVhY2gKeWVh
ciwgYW4gZWxlY3Rpb24gaXMgaGVsZCB0byBicmluZyB0aGUgdG90YWwgbnVtYmVyIG9mIGRpcmVj
dG9ycyB0bwplaWdodC4gVGhlIGZvdXIgbWVtYmVycyByZWNlaXZpbmcgdGhlIGhpZ2hlc3Qgdm90
ZSB0b3RhbHMgd2lsbCBzZXJ2ZQphcyBkaXJlY3RvcnMgZm9yIHR3byB5ZWFyIHRlcm1zLgoKVGhl
IGRpcmVjdG9ycyB3aG8gcmVjZWl2ZWQgdHdvIHllYXIgdGVybXMgc3RhcnRpbmcgaW4gMjAxOSB3
ZXJlU2FtdWVsCklnbGVzaWFzIEdvbnPDoWx2ZXosIE1hbmFzaSBEIE5hdmFyZSwgTHl1ZGUgUGF1
bCBhbmQgRGFuaWVsIFZldHRlci4KVGhleSB3aWxsIGNvbnRpbnVlIHRvIHNlcnZlIHVudGlsIHRo
ZWlyIHRlcm0gZW5kcyBpbiAyMDIxLiBDdXJyZW50CmRpcmVjdG9ycyB3aG9zZSB0ZXJtIGV4cGly
ZXMgaW4gMjAyMCBhcmUgRXJpYyBBbmhvbHQsICBCcnljZQpIYXJyaW5ndG9uLCBLZWl0aCBQYWNr
YXJkIGFuZCBIYXJyeSBXZW50bGFuZC4KCkEgZGlyZWN0b3IgaXMgZXhwZWN0ZWQgdG8gcGFydGlj
aXBhdGUgaW4gdGhlIGZvcnRuaWdodGx5IElSQyBtZWV0aW5nCnRvIGRpc2N1c3MgY3VycmVudCBi
dXNpbmVzcyBhbmQgdG8gYXR0ZW5kIHRoZSBhbm51YWwgbWVldGluZyBvZiB0aGUKWC5PcmcgRm91
bmRhdGlvbiwgd2hpY2ggd2lsbCBiZSBoZWxkIGF0IGEgbG9jYXRpb24gZGV0ZXJtaW5lZCBpbgph
ZHZhbmNlIGJ5IHRoZSBCb2FyZCBvZiBEaXJlY3RvcnMuCgpBIG1lbWJlciBtYXkgbm9taW5hdGUg
dGhlbXNlbHZlcyBvciBhbnkgb3RoZXIgbWVtYmVyIHRoZXkgZmVlbCBpcwpxdWFsaWZpZWQuIE5v
bWluYXRpb25zIHNob3VsZCBiZSBzZW50IHRvIHRoZSBFbGVjdGlvbiBDb21taXR0ZWUgYXQKZWxl
Y3Rpb25zIGF0IHgub3JnLgoKTm9taW5lZXMgc2hhbGwgYmUgcmVxdWlyZWQgdG8gYmUgY3VycmVu
dCBtZW1iZXJzIG9mIHRoZSBYLk9yZwpGb3VuZGF0aW9uLCBhbmQgc3VibWl0IGEgcGVyc29uYWwg
c3RhdGVtZW50IG9mIHVwIHRvIDIwMCB3b3JkcyB0aGF0CndpbGwgYmUgcHJvdmlkZWQgdG8gcHJv
c3BlY3RpdmUgdm90ZXJzLiBUaGUgY29sbGVjdGVkIHN0YXRlbWVudHMsCmFsb25nIHdpdGggdGhl
IHN0YXRlbWVudCBvZiBjb250cmlidXRpb24gdG8gdGhlIFguT3JnIEZvdW5kYXRpb24gaW4KdGhl
IG1lbWJlcidzIGFjY291bnQgcGFnZSBvbiBodHRwOi8vbWVtYmVycy54Lm9yZywgd2lsbCBiZSBt
YWRlCmF2YWlsYWJsZSB0byBhbGwgdm90ZXJzIHRvIGhlbHAgdGhlbSBtYWtlIHRoZWlyIHZvdGlu
ZyBkZWNpc2lvbnMuCgpOb21pbmF0aW9ucywgbWVtYmVyc2hpcCBhcHBsaWNhdGlvbnMgb3IgcmVu
ZXdhbHMgYW5kIGNvbXBsZXRlZApwZXJzb25hbCBzdGF0ZW1lbnRzIG11c3QgYmUgcmVjZWl2ZWQg
bm8gbGF0ZXIgdGhhbiAyMzo1OSBVVEMgb24gMDIKQXByaWwgMjAyMC4KClRoZSBzbGF0ZSBvZiBj
YW5kaWRhdGVzIHdpbGwgYmUgcHVibGlzaGVkIDYgQXByaWwgMjAyMCBhbmQgY2FuZGlkYXRlClEm
QSB3aWxsIGJlZ2luIHRoZW4uIFRoZSBkZWFkbGluZSBmb3IgWG9yZyBtZW1iZXJzaGlwIGFwcGxp
Y2F0aW9ucyBhbmQKcmVuZXdhbHMgaXMgMDIgQXByaWwgMjAyMC4KCkNoZWVycywgRGFuaWVsLCBv
biBiZWhhbGYgb2YgdGhlIFguT3JnIEJvRAoKUFM6IEkgY2MnZWQgdGhlIHVzdWFsIGRldiBsaXN0
cyBzaW5jZSBub3QgbWFueSBtZW1iZXJzIHB1dCBpbiB0aGUgcmVuZXdhbCB5ZXQuCi0tIApEYW5p
ZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5
IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
