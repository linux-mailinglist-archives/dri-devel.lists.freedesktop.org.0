Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F54F0139
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 16:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFA46EAB1;
	Tue,  5 Nov 2019 15:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E48E6EAB1
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 15:24:00 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id z9so2510060uan.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2019 07:24:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=mzxx4q3zbP0+Gm7RYRnPelsRNlHMKh4GipKmOSFPYmg=;
 b=Ixuiv8GXXSSdRcUP7YiVE62uSRkq4AXoSUnv4v/+O8BP/LjIqjEvv1PkhhxBybRd+n
 jNaN+wtDNy2gkAA0rg7bo9/MII+yf/QKvMMTi0N10VRGTg5PeglxUpxcATFQzUg5sZNe
 ZL9BYP7tRjOP0ypSqRsNyKpC3B6QYY4ou/GrgkF7PaaPTxrcOEK1GLBeNIy04c+5wo+w
 GOLppzhF2hPChFq45Xbafrl7rRU4WgaglW5kgLs9TtPYBhl4mdBQcQ8RIKuyMrYJQhS9
 7wTjnGghMeeg+VsCdiWau5sJs/HXD7MLnCGnvy2jF6/tL2bGcQ8GOG+39GtsJjoYw3Qj
 8wEg==
X-Gm-Message-State: APjAAAUEyO83J4z6yG5kO/5U8EOq7s3XdDGPt0ePQrbYPj9cYZMl3PCk
 fNzjebg8J3uugmmMHUGB6aye3A==
X-Google-Smtp-Source: APXvYqz6jAq55aznS2faEtqWpKVL90iHdEAxmqu39XTzHi2huJY5mRTQ+Wnq9dpRuTxjEPfENNTQVQ==
X-Received: by 2002:ab0:7284:: with SMTP id w4mr15440252uao.116.1572967439016; 
 Tue, 05 Nov 2019 07:23:59 -0800 (PST)
Received: from linux-kernel-dev ([172.97.41.74])
 by smtp.gmail.com with ESMTPSA id 47sm6030638uas.2.2019.11.05.07.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 07:23:58 -0800 (PST)
Date: Tue, 5 Nov 2019 15:23:57 +0000
From: "Frank A. Cancio Bello" <frank@generalsoftwareinc.com>
To: dri-devel@lists.freedesktop.org
Subject: Outreachy applicant presentation
Message-ID: <20191105152357.say3ublpv4i6pb3k@linux-kernel-dev>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=generalsoftwareinc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=mzxx4q3zbP0+Gm7RYRnPelsRNlHMKh4GipKmOSFPYmg=;
 b=Xp1TJJYzV0R19GN+L13D9gnn60mlukr5kPlxw6gF632kwWcbX3fEM6jrx0oSDEzUmL
 kUWRmt1qFO+Ir4+X3/1koUlVXH7iSLOxzkFCYrvRaC3wV4X+dkKgLt2PRwCAeNeeIdZj
 pVY4QgzlUl8r0grLK8nhAOZHwyZlpyiDKIKCCV/XXlJNw+sxqCa7n/bwPV5isTVPVX4f
 wC3ZhBVWPicLlIIu5+MdGG4+lX2/PzxR/SJNywOHqhsdeiHj0p/fslfp466beLU7pLnI
 jxr7BXkstQ0DXcYv0kkVO7LMdFN63ba0BrtfjZ4bBSlIY2/uk1clZx0afEP0Yd55wpGY
 klRA==
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
Cc: manasi.d.navare@intel.com, rodrigosiqueiramelo@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpNeSBuYW1lIGlzIEZyYW5rIEEuIENhbmNpbyBCZWxsby4gSSdtIGFuIGFwcGxpY2FudCBv
ZiB0aGUgT3V0cmVhY2h5CnByb2dyYW0gYW5kIHRoZSBnb2FsIG9mIHRoaXMgZW1haWwgaXMgdG8g
aW50cm9kdWNlIG15c2VsZiBiZWNhdXNlCkknbSBpbnRlcmVzdGVkIGluIHRoZSBwcm9qZWN0OiBM
aW51eCBLZXJuZWwgLSBWS01TLiBCZXNpZGVzIEkgd2FudCB0bwpsZXQgeW91IGtub3cgYWJvdXQg
bXkgcGxhbnMgYW5kIGdldCBmZWVkYmFjayBmcm9tIHlvdS4KCiMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKIyMjIyMjIyMjICBBYm91dCBtZSAgIyMjIyMjIyMjIwojIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCkkgZ290IGludHJvZHVjZWQgdG8gc29mdHdhcmUgZGV2ZWxvcG1l
bnQgMjUgeWVhcnMgYWdvIHdoZW4gSSB3YXMKYWJvdXQgMTIgeWVhcnMgb2xkLiBTaW5jZSB0aGVu
IEkgaGF2ZSBiZWVuIGRldmVsb3Bpbmcgc29mdHdhcmUgaW4gQywKQysrLCBQYXNjYWwsIEMjLCBQ
eXRob24sIGFuZCBKYXZhU2NyaXB0LiBJbiAyMDA2IEkgZmluaXNoZWQgbXkgbWFqb3IKaW4gU29m
dHdhcmUgRW5naW5lZXIgaW4gSGF2YW5hLCBDdWJhLiBJIHdvcmtlZCBwcm9mZXNzaW9uYWxseSBh
cyBhCnN5c2FkbWluLiBJIG1hbmFnZWQgYSBjb21wdXRlciBuZXR3b3JrIG9mIG92ZXIgM2sgZm9y
IG1vcmUKdGhhbiA2IHllYXJzLiBJIGxlZCBhIHRlYW0gb2YgZGV2ZWxvcGVycyB0aGF0IGNyZWF0
ZWQgc2V2ZXJhbCBjdXN0b20KbmV0d29yayBtYW5hZ2VtZW50IHRvb2xzLgoKSSBoYXZlIHRoaXMg
ZHJlYW0gdG8gYmVjb21lIGEgc2VyaW91cyBMaW51eCBLZXJuZWwgY29tbWl0dGVyLgpJJ20gdGly
ZWQgb2YgdG9vIG1hbnkgY2xpZW50IG1lZXRpbmdzLCBJIG1pc3MgdGhlIHRlY2huaWNhbCBwYXJ0
CnRoYXQgaXMgd2hhdCBJIHJlYWxseSBlbmpveS4gSSBhbHJlYWR5IGFycmFuZ2UgZXZlcnl0aGlu
ZyBvbiBteSBzaWRlCnRvIGJlIGFibGUgdG8gZGVkaWNhdGUgbW9zdCBvZiBteSBkYXkgYW5kIG5p
Z2h0IHRvIHRoaXMgcHVycG9zZS4KT3V0cmVhY2h5IGFuZCB5b3VyIG1lbnRvcnNoaXAgd2lsbCBk
ZWZpbml0ZWx5IHNwZWVkIHVwIHRoYXQgcHJvY2Vzcy4KCgojIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjCiMjIyMjIyMjIyMgIFN0YXR1cyAgIyMjIyMjIyMjIyMKIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwpGb2xsb3dpbmcgdGhlIFByb2plY3QgQ29udHJpYnV0aW9uIHNlY3Rp
b24gb2YKaHR0cHM6Ly93d3cub3V0cmVhY2h5Lm9yZy9kZWNlbWJlci0yMDE5LXRvLW1hcmNoLTIw
MjAtaW50ZXJuc2hpcC1yb3VuZC9jb21tdW5pdGllcy9saW51eC1rZXJuZWwvI3ZrbXMKSSBhbHJl
YWR5IGRpZDoKCiogU3RhcnQgYnkgbGVhcm4gaG93IHRvIHNlbmQgYSBwYXRjaCB0byB0aGUgTGlu
dXggS2VybmVsIChpdCBjb3VsZCBiZQogIGNoZWNrcGF0Y2gpCgoqIFJlYWQgYWJvdXQgRFJJIGlu
IHRoZSB3aWtpcGVkaWEKCgphbmQgSSdtIHdvcmtpbmcgb246CgoqIFJlYWQgdGhlIERSSSBkZXZl
bCBkb2N1bWVudGF0aW9uCgpBbnkgZmVlZGJhY2sgb3Igc21hbGwgdGFzayB0byBndWlkZSBteSB0
aW1lIGludmVzdG1lbnQgd2lsbCBiZSBoaWdseSAKYXBwcmVjaWF0ZS4KCnRoYW5rcwpmcmFuayBh
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
