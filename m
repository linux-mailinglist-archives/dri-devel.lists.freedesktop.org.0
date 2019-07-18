Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1B46CF75
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 16:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CDD6E3D3;
	Thu, 18 Jul 2019 14:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9B0C96E3D8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 14:10:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9766672167; Thu, 18 Jul 2019 14:10:57 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109206] Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U
Date: Thu, 18 Jul 2019 14:10:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: evo8800@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109206-502-OuJrkDuM1M@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109206-502@http.bugs.freedesktop.org/>
References: <bug-109206-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============0868239674=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0868239674==
Content-Type: multipart/alternative; boundary="15634590572.FF0F2c.1335"
Content-Transfer-Encoding: 7bit


--15634590572.FF0F2c.1335
Date: Thu, 18 Jul 2019 14:10:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109206

--- Comment #61 from Talha Khan <evo8800@gmail.com> ---
(In reply to Michael Eagle from comment #60)
> Created attachment 144787 [details]
> attachment-8612-0.html
>=20
> I am seeing reports with old BIOS, such as F.19.
> I have a 15-cp0001na
> https://support.hp.com/ie-en/drivers/selfservice/hp-envy-15-cp0000-x360-
> convertible-pc/20270303/model/23086446
> Latest available is F.42 Rev.A
> I am wondering if by any chance would be a match to other models also.

The latest BIOS for my HP Envy x360 15-bq100 is F.21:
https://support.hp.com/us-en/drivers/selfservice/swdetails/hp-envy-15-bq100=
-x360-convertible-pc/16851053/model/18706859/swItemId/ob-232955-1?sku=3D1ZA=
02AV

My current kernel is 5.1.17-300 and so far there hasn't been any boot issues
yet.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15634590572.FF0F2c.1335
Date: Thu, 18 Jul 2019 14:10:57 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109206#c61">Comme=
nt # 61</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109206">bug 10920=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
evo8800&#64;gmail.com" title=3D"Talha Khan &lt;evo8800&#64;gmail.com&gt;"> =
<span class=3D"fn">Talha Khan</span></a>
</span></b>
        <pre>(In reply to Michael Eagle from <a href=3D"show_bug.cgi?id=3D1=
09206#c60">comment #60</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D144787" name=3D"attach_144787" title=3D"attachment-8612-0.html">att=
achment 144787</a> <a href=3D"attachment.cgi?id=3D144787&amp;action=3Dedit"=
 title=3D"attachment-8612-0.html">[details]</a></span>
&gt; attachment-8612-0.html
&gt;=20
&gt; I am seeing reports with old BIOS, such as F.19.
&gt; I have a 15-cp0001na
&gt; <a href=3D"https://support.hp.com/ie-en/drivers/selfservice/hp-envy-15=
-cp0000-x360">https://support.hp.com/ie-en/drivers/selfservice/hp-envy-15-c=
p0000-x360</a>-
&gt; convertible-pc/20270303/model/23086446
&gt; Latest available is F.42 Rev.A
&gt; I am wondering if by any chance would be a match to other models also.=
</span >

The latest BIOS for my HP Envy x360 15-bq100 is F.21:
<a href=3D"https://support.hp.com/us-en/drivers/selfservice/swdetails/hp-en=
vy-15-bq100-x360-convertible-pc/16851053/model/18706859/swItemId/ob-232955-=
1?sku=3D1ZA02AV">https://support.hp.com/us-en/drivers/selfservice/swdetails=
/hp-envy-15-bq100-x360-convertible-pc/16851053/model/18706859/swItemId/ob-2=
32955-1?sku=3D1ZA02AV</a>

My current kernel is 5.1.17-300 and so far there hasn't been any boot issues
yet.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15634590572.FF0F2c.1335--

--===============0868239674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0868239674==--
