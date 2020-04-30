Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 975281BF171
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884516EB58;
	Thu, 30 Apr 2020 07:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 594 seconds by postgrey-1.36 at gabe;
 Thu, 30 Apr 2020 03:42:14 UTC
Received: from smtphy.263.net (syd-smtp02.263.net [13.237.61.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BA06E11F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 03:42:13 +0000 (UTC)
Received: from regular2.263xmail.com (unknown [211.157.147.162])
 by smtphy.263.net (Postfix) with ESMTPS id B6CB9120139
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 11:32:17 +0800 (CST)
Received: from regular1.263xmail.com (unknown [192.168.165.233])
 by regular2.263xmail.com (Postfix) with ESMTP id 3A65B295
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 11:32:10 +0800 (CST)
Received: from localhost (unknown [192.168.167.245])
 by regular1.263xmail.com (Postfix) with ESMTP id D96342B7;
 Thu, 30 Apr 2020 11:32:04 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from bj-wm-cp-13 (unknown [192.168.167.117])
 by smtp.263.net (postfix) whith ESMTP id
 P22196T140243398170368S1588217488568177_; 
 Thu, 30 Apr 2020 11:31:28 +0800 (CST)
X-UNIQUE-TAG: <a9898bf47a91a8b354c2a6e598d5ae53>
X-RL-SENDER: caizhaopeng@uniontech.com
X-SENDER: caizhaopeng@uniontech.com
X-LOGIN-NAME: wmsendmail@net263.com
X-FST-TO: vvs@virtuozzo.com
X-SENDER-IP: 192.168.167.117
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Date: Thu, 30 Apr 2020 11:31:28 +0800 (CST)
From: =?UTF-8?B?6JSh5YWG6bmP?= <caizhaopeng@uniontech.com>
To: =?UTF-8?B?VmFzaWx5IEF2ZXJpbiA=?= <vvs@virtuozzo.com>, 
 =?UTF-8?B?R2VyZCBIb2ZmbWFubiA=?= <kraxel@redhat.com>
Message-ID: <1166974425.1169539.1588217488251.JavaMail.xmail@bj-wm-cp-13>
References: <20200421084300.zggroiptwbrblzqy () sirius ! home ! kraxel ! org>, 
 <bc954de7-bfe0-8e0c-79d4-90d726a0ffa6@virtuozzo.com>
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSCAxLzFdIGRybS9xeGw6IGFkZCBtdXRleF9sb2NrL211dGV4X3VubG9jayB0byBlbnN1cmUgdGhlb3JkZXIgaW4gd2hpY2ggcmVzb3VyY2VzIGFyZSByZWxl?=
MIME-Version: 1.0
X-Send-Individually: 0
X-Reply-Previous-EmailId: 
X-SENDER-IP: 61.153.251.58
X-Revoke-Status: 851a78b71095473fb5d87ba89c06362d<caizhaopeng@uniontech.com
X-Priority: 3
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:31:56 +0000
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
Cc: =?UTF-8?B?RGVuaXMgVi4gTHVuZXYg?= <den@virtuozzo.com>,
 =?UTF-8?B?RGF2aWQgQWlybGllIA==?= <airlied@linux.ie>,
 =?UTF-8?B?bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyA=?=
 <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?ZHJpLWRldmVsIA==?= <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?dmlydHVhbGl6YXRpb24g?= <virtualization@lists.linux-foundation.org>,
 =?UTF-8?B?RGF2ZSBBaXJsaWUg?= <airlied@redhat.com>
Content-Type: multipart/mixed; boundary="===============0146700167=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0146700167==
Content-Type: text/html;  charset=utf-8
Content-Transfer-Encoding: base64

PHN0eWxlPnRhYmxlLmN1c3RvbVRhYmxlQ2xhc3NOYW1lIHttYXJnaW4tYm90dG9tOiAxMHB4O2Jv
cmRlci1jb2xsYXBzZTogY29sbGFwc2U7ZGlzcGxheTogdGFibGU7fS5jdXN0b21UYWJsZUNsYXNz
TmFtZSB0ZCwgLmN1c3RvbVRhYmxlQ2xhc3NOYW1lIHRoIHtib3JkZXI6IDFweCBzb2xpZCAjZGRk
O308L3N0eWxlPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+aGk8YnI+PGJyPjxzcGFuIHN0eWxlPSJ0
ZXh0LWRlY29yYXRpb246IHVuZGVybGluZTsgY29sb3I6IHJnYigwLCAxNzYsIDI0MCk7Ij5JIGFt
IHNvcnJ5IHRoYXQgSSBoYXZlIG5vdCByZXNwb25kZWQgdG8geW91ciBlbWFpbHMgZHVyaW5nIHRo
b3NlIGRheXMuJm5ic3A7PC9zcGFuPjwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPjxzcGFuIHN0
eWxlPSJ0ZXh0LWRlY29yYXRpb246IHVuZGVybGluZTsgY29sb3I6IHJnYigwLCAxNzYsIDI0MCk7
Ij5JIHdhcyBxdWFyYW50aW5lZCBmb3IgMTQgZGF5cyBmb3Igc3VzcGVjdGVkIDIwMTktbmNvdiBw
bmV1bW9uaWEsSeKAmG0gZnJlZSBub3cuJm5ic3A7PC9zcGFuPjwvcD48cCBzdHlsZT0ibWFyZ2lu
OjBweDsiPjxicj5PbiA0LzIxLzIwIDExOjQzIEFNLCBHZXJkIEhvZmZtYW5uIHdyb3RlOjxicj4m
Z3Q7IE9uIFNhdCwgQXByIDE4LCAyMDIwIGF0IDAyOjM5OjE3UE0gKzA4MDAsIENhaWNhaSB3cm90
ZTo8YnI+Jmd0OyZndDsgV2hlbiBhIHF4bCByZXNvdXJjZSBpcyByZWxlYXNlZCwgdGhlIGxpc3Qg
dGhhdCBuZWVkcyB0byBiZSByZWxlYXNlZCBpczxicj4mZ3Q7Jmd0OyBmZXRjaGVkIGZyb20gdGhl
IGxpbmtlZCBsaXN0IHJpbmcgYW5kIGNsZWFyZWQuIFdoZW4geW91IGVtcHR5IHRoZSBsaXN0LDxi
cj4mZ3Q7Jmd0OyBpbnN0ZWFkIG9mIHRyeWluZyB0byBkZXRlcm1pbmUgd2hldGhlciB0aGUgdHRt
IGJ1ZmZlciBvYmplY3QgZm9yIGVhY2g8YnI+Jmd0OyZndDsgcXhsIGluIHRoZSBsaXN0IGlzIGxv
Y2tlZCwgeW91IHJlbGVhc2UgdGhlIHF4bCBvYmplY3QgYW5kIHJlbW92ZSB0aGU8YnI+Jmd0OyZn
dDsgZWxlbWVudCBmcm9tIHRoZSBsaXN0IHVudGlsIHRoZSBsaXN0IGlzIGVtcHR5LiBJdCB3YXMg
Zm91bmQgdGhhdCB0aGU8YnI+Jmd0OyZndDsgbGlua2VkIGxpc3Qgd2FzIGNsZWFyZWQgZmlyc3Qs
IGFuZCB0aGF0IHRoZSBsb2NrIG9uIHRoZSBjb3JyZXNwb25kaW5nPGJyPiZndDsmZ3Q7IHR0bSBC
byBmb3IgdGhlIFFYTCBoYWQgbm90IGJlZW4gcmVsZWFzZWQsIHNvIHRoYXQgdGhlIG5ldyBxeGwg
Y291bGQgbm90PGJyPiZndDsmZ3Q7IGJlIGxvY2tlZCB3aGVuIGl0IHVzZWQgdGhlIFRUTS48YnI+
Jmd0OyA8YnI+Jmd0OyBTbyB0aGUgZG1hX3Jlc3ZfcmVzZXJ2ZV9zaGFyZWQoKSBjYWxsIGluIHF4
bF9yZWxlYXNlX3ZhbGlkYXRlX2JvKCkgaXM8YnI+Jmd0OyB1bmJhbGFuY2VkPyAmbmJzcDtCZWNh
dXNlIHRoZSBkbWFfcmVzdl91bmxvY2soKSBjYWxsIGluPGJyPiZndDsgcXhsX3JlbGVhc2VfZmVu
Y2VfYnVmZmVyX29iamVjdHMoKSBuZXZlciBoYXBwZW5zIGR1ZSB0bzxicj4mZ3Q7IHF4bF9yZWxl
YXNlX2ZyZWVfbGlzdCgpIGNsZWFyaW5nIHRoZSBsaXN0IGJlZm9yZWhhbmQ/ICZuYnNwO0lzIHRo
YXQgY29ycmVjdD88YnI+PGJyPndlIG9ic2VydmUgc2ltaWxhciBpc3N1ZTogUkhFTDcgZ3Vlc3Rz
IGNyYXNoZXMgaW4gPGJyPnF4bF9kcmF3X29wYXF1ZV9mYigpPGJyPiBxeGxfcmVsZWFzZV9mZW5j
ZV9idWZmZXJfb2JqZWN0cygpIDxicj48YnI+Y3Jhc2hkdW1wIGludmVzdGlnYXRpb24gc2hvd3Mg
dGhhdCBxbHhfb2JqZWN0IHdhcyBmcmVlZCBhbmQgcmV1c2VkLDxicj5zbyBpdHMgb3JpZ2luYWwg
Y29udGVudCB3YXMgcmUtd3JpdHRlbi48YnI+PGJyPkF0IHRoZSBzYW1lIHRpbWUgcXhsX2Rldmlj
ZSBoYXZlIGVtcHR5IHJlbGVhc2VfaWRyLDxicj5hbnQgdGhlcmUgYXJlIG5vIGFsbG9jYXRlZCBx
eGxfYm9fbGlzdCBlbnRyaWVzLjxicj5pLmUuIHF4bF9yZWxlYXNlX2ZyZWUgd2FzIHJlYWxseSBj
YWxsZWQuPGJyPjxicj48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigwLCAxNzYsIDI0MCk7IHRleHQt
ZGVjb3JhdGlvbjogbm9uZTsiPlRoYXQncyBleGFjdGx5IHJpZ2h044CCSSBmb3VuZCB0aGF0Jm5i
c3A7cXhsX2JvX2xpc3QgaGFkIGVtcHRlZCwgdHRtX2J1ZmZlcl9vYmplY3QgKCBxeGxfYm8tJmd0
O3Ribykgd2hpY2ggc3RpbGwgbG9ja2VkLCZuYnNwOzwvc3Bhbj48L3A+PHAgc3R5bGU9Im1hcmdp
bjowcHg7Ij48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigwLCAxNzYsIDI0MCk7IHRleHQtZGVjb3Jh
dGlvbjogbm9uZTsiPnRoZW4gb3RoZXIgbmV3IHF4bCB3aGljaCBuZWVkZWQgdGJvIGNhbm5vdCBs
b2NrdXAuPC9zcGFuPjwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPjxmb250IGNvbG9yPSIjMDBi
MGYwIj48YnI+PC9mb250PiZndDsgVGhlIG9ubHkgd2F5IEkgc2VlIGZvciB0aGlzIHRvIGhhcHBl
biBpcyB0aGF0IHRoZSBndWVzdCBpcyBwcmVlbXB0ZWQ8YnI+Jmd0OyBiZXR3ZWVuIHF4bF9wdXNo
X3tjdXJzb3IsY29tbWFuZH1fcmluZ19yZWxlYXNlKCkgYW5kPGJyPiZndDsgcXhsX3JlbGVhc2Vf
ZmVuY2VfYnVmZmVyX29iamVjdHMoKSBjYWxscy4gJm5ic3A7VGhlIGhvc3QgY2FuIGNvbXBsZXRl
IHRoZSBxeGw8YnI+Jmd0OyBjb21tYW5kIHRoZW4sIHNpZ25hbCB0aGUgZ3Vlc3QsIGFuZCB0aGUg
SVJRIGhhbmRsZXIgY2FsbHM8YnI+Jmd0OyBxeGxfcmVsZWFzZV9mcmVlX2xpc3QoKSBiZWZvcmUg
cXhsX3JlbGVhc2VfZmVuY2VfYnVmZmVyX29iamVjdHMoKSBydW5zLjxicj48YnI+V2UgdGhpbmsg
dGhlIHNhbWU6IHF4bF9yZWxlYXNlIHdhcyBmcmVlZCBieSBnYXJiYWdlIGNvbGxlY3RvciBiZWZv
cmU8YnI+b3JpZ2luYWwgdGhyZWFkIGhhZCBjYWxsZWQgcXhsX3JlbGVhc2VfZmVuY2VfYnVmZmVy
X29iamVjdHMoKS48YnI+PGJyPiZndDsgTG9va2luZyB0aHJvdWdoIHRoZSBjb2RlIEkgdGhpbmsg
aXQgc2hvdWxkIGJlIHNhZmUgdG8gc2ltcGx5IHN3YXAgdGhlPGJyPiZndDsgcXhsX3JlbGVhc2Vf
ZmVuY2VfYnVmZmVyX29iamVjdHMoKSArPGJyPiZndDsgcXhsX3B1c2hfe2N1cnNvcixjb21tYW5k
fV9yaW5nX3JlbGVhc2UoKSBjYWxscyB0byBjbG9zZSB0aGF0IHJhY2U8YnI+Jmd0OyB3aW5kb3cu
ICZuYnNwO0NhbiB5b3UgdHJ5IHRoYXQgYW5kIHNlZSBpZiBpdCBmaXhlcyB0aGUgYnVnIGZvciB5
b3U/PGJyPjxicj5JJ20gZ29pbmcgdG8gcHJlcGFyZSBhbmQgdGVzdCBzdWNoIHBhdGNoIGJ1dCBJ
IGhhdmUgb25lIHF1ZXN0aW9uIGhlcmU6PGJyPnF4bF9wdXNoXypfcmluZ19yZWxlYXNlIGNhbiBi
ZSBjYWxsZWQgd2l0aCAmbmJzcDtpbnRlcnJ1cHRpYmxlPXRydWUgYW5kIGZhaWw8YnI+SG93IHRv
IGNvcnJlY3RseSBoYW5kbGUgdGhpcyBjYXNlPyBJcyB0aGUgaHVuayBiZWxvdyBjb3JyZWN0IGZy
b20geW91ciBQT1Y/PC9wPjxwIHN0eWxlPSJtYXJnaW46MHB4OyI+PGJyPjwvcD48cCBzdHlsZT0i
bWFyZ2luOjBweDsiPjxicj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9pb2N0bC5jPGJy
PisrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2lvY3RsLmM8YnI+QEAgLTI2MSwxMiArMjYx
LDggQEAgc3RhdGljIGludCBxeGxfcHJvY2Vzc19zaW5nbGVfY29tbWFuZChzdHJ1Y3QgcXhsX2Rl
dmljZSAqcWRldiw8YnI+ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7YXBwbHlfc3VyZl9yZWxv
YyhxZGV2LCAmYW1wO3JlbG9jX2luZm9baV0pOzxicj4gJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7fTxicj4gPGJyPisgJm5ic3A7ICZuYnNwOyAmbmJzcDsgcXhsX3JlbGVhc2VfZmVuY2VfYnVm
ZmVyX29iamVjdHMocmVsZWFzZSk7PGJyPiAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtyZXQg
PSBxeGxfcHVzaF9jb21tYW5kX3JpbmdfcmVsZWFzZShxZGV2LCByZWxlYXNlLCBjbWQtJmd0O3R5
cGUsIHRydWUpOzxicj4tICZuYnNwOyAmbmJzcDsgJm5ic3A7IGlmIChyZXQpPGJyPi0gJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IHF4bF9yZWxlYXNlX2Jh
Y2tvZmZfcmVzZXJ2ZV9saXN0KHJlbGVhc2UpOyAmbmJzcDsmbHQ7Jmx0OyZsdDsmbHQ7ID8/Pz88
YnI+LSAmbmJzcDsgJm5ic3A7ICZuYnNwOyBlbHNlPGJyPi0gJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IHF4bF9yZWxlYXNlX2ZlbmNlX2J1ZmZlcl9vYmpl
Y3RzKHJlbGVhc2UpOzxicj4tPGJyPiBvdXRfZnJlZV9ib3M6PGJyPiBvdXRfZnJlZV9yZWxlYXNl
Ojxicj48YnI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMCwgMTc2LCAyNDApOyB0ZXh0LWRlY29y
YXRpb24tbGluZTogdW5kZXJsaW5lOyI+SSdsbCZuYnNwOyB0ZXN0IHRoaXMgc3VjaCBwYXRjaC48
L3NwYW4+PGJyPjxicj5UaGFuayB5b3UsPGJyPglWYXNpbHkgQXZlcmluPC9wPjxwIHN0eWxlPSJt
YXJnaW46MHB4OyI+PGJyPjwvcD48cCBzdHlsZT0ibWFyZ2luOjBweDsiPlRoYW5rcyBzbyBtdWNo
IGZvciB5b3VyIGhlbHAuPC9wPg==



--===============0146700167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0146700167==--
