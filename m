Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EE3DBD18
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 07:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD9D6E10D;
	Fri, 18 Oct 2019 05:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5B6906E10D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 05:34:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 55A9D7296E; Fri, 18 Oct 2019 05:34:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112017] [CI][SHARDS]igt@kms_frontbuffer_tracking@* - fail -
 Failed assertion: drm.bufmgr
Date: Fri, 18 Oct 2019 05:34:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: cibuglog@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112017-502-li8GYELlga@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112017-502@http.bugs.freedesktop.org/>
References: <bug-112017-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1875424012=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1875424012==
Content-Type: multipart/alternative; boundary="15713768812.cDfe281.2511"
Content-Transfer-Encoding: 7bit


--15713768812.cDfe281.2511
Date: Fri, 18 Oct 2019 05:34:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112017

--- Comment #4 from CI Bug Log <cibuglog@gmail.com> ---
The CI Bug Log issue associated to this bug has been updated.

### New filters associated

* TGL: igt@kms_psr@*|igt@gem__* - fail - Failed assertion: data.bufmgr
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3573/fi-tgl-u/igt@kms_psr@pr=
imary_mmap_gtt.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3573/fi-tgl-u2/igt@kms_psr@p=
rimary_mmap_gtt.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb1/igt@kms_psr@p=
sr2_cursor_mmap_gtt.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb1/igt@gem_rende=
r_copy@yf-tiled-ccs-to-y-tiled.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb1/igt@kms_psr@p=
sr2_sprite_plane_move.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb1/igt@kms_psr@d=
pms.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb3/igt@kms_psr@p=
rimary_mmap_gtt.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb3/igt@kms_psr@s=
prite_mmap_cpu.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb3/igt@kms_psr@p=
sr2_sprite_plane_onoff.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb4/igt@kms_psr@p=
sr2_cursor_plane_onoff.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb4/igt@kms_psr@p=
sr2_sprite_mmap_cpu.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb4/igt@kms_psr@b=
asic.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb6/igt@kms_psr@p=
sr2_no_drrs.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb6/igt@kms_psr@s=
prite_mmap_gtt.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb6/igt@gem_media=
_fill.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb7/igt@gem_rende=
r_copy@y-tiled-ccs-to-linear.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb7/igt@kms_psr@s=
prite_render.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3573/shard-tglb3/igt@kms_psr=
@basic.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3574/fi-tgl-u/igt@kms_psr@pr=
imary_mmap_gtt.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3574/fi-tgl-u2/igt@kms_psr@p=
rimary_mmap_gtt.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3575/fi-tgl-u/igt@kms_psr@pr=
imary_mmap_gtt.html
  -
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3575/fi-tgl-u2/igt@kms_psr@p=
rimary_mmap_gtt.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15713768812.cDfe281.2511
Date: Fri, 18 Oct 2019 05:34:41 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][SHARDS]igt&#64;kms_frontbuffer_tracking&#=
64;* - fail - Failed assertion: drm.bufmgr"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112017#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][SHARDS]igt&#64;kms_frontbuffer_tracking&#=
64;* - fail - Failed assertion: drm.bufmgr"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112017">bug 11201=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cibuglog&#64;gmail.com" title=3D"CI Bug Log &lt;cibuglog&#64;gmail.com&gt;"=
> <span class=3D"fn">CI Bug Log</span></a>
</span></b>
        <pre>The CI Bug Log issue associated to this bug has been updated.

### New filters associated

* TGL: igt&#64;kms_psr&#64;*|igt&#64;gem__* - fail - Failed assertion: data=
.bufmgr
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3573/fi-tgl-u/igt=
&#64;kms_psr&#64;primary_mmap_gtt.html">https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_3573/fi-tgl-u/igt&#64;kms_psr&#64;primary_mmap_gtt.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3573/fi-tgl-u2/ig=
t&#64;kms_psr&#64;primary_mmap_gtt.html">https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_3573/fi-tgl-u2/igt&#64;kms_psr&#64;primary_mmap_gtt.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb1/ig=
t&#64;kms_psr&#64;psr2_cursor_mmap_gtt.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_5226/shard-tglb1/igt&#64;kms_psr&#64;psr2_cursor_mmap_gtt.ht=
ml</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb1/ig=
t&#64;gem_render_copy&#64;yf-tiled-ccs-to-y-tiled.html">https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_5226/shard-tglb1/igt&#64;gem_render_copy&#64;yf-t=
iled-ccs-to-y-tiled.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb1/ig=
t&#64;kms_psr&#64;psr2_sprite_plane_move.html">https://intel-gfx-ci.01.org/=
tree/drm-tip/IGT_5226/shard-tglb1/igt&#64;kms_psr&#64;psr2_sprite_plane_mov=
e.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb1/ig=
t&#64;kms_psr&#64;dpms.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5=
226/shard-tglb1/igt&#64;kms_psr&#64;dpms.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb3/ig=
t&#64;kms_psr&#64;primary_mmap_gtt.html">https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_5226/shard-tglb3/igt&#64;kms_psr&#64;primary_mmap_gtt.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb3/ig=
t&#64;kms_psr&#64;sprite_mmap_cpu.html">https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGT_5226/shard-tglb3/igt&#64;kms_psr&#64;sprite_mmap_cpu.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb3/ig=
t&#64;kms_psr&#64;psr2_sprite_plane_onoff.html">https://intel-gfx-ci.01.org=
/tree/drm-tip/IGT_5226/shard-tglb3/igt&#64;kms_psr&#64;psr2_sprite_plane_on=
off.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb4/ig=
t&#64;kms_psr&#64;psr2_cursor_plane_onoff.html">https://intel-gfx-ci.01.org=
/tree/drm-tip/IGT_5226/shard-tglb4/igt&#64;kms_psr&#64;psr2_cursor_plane_on=
off.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb4/ig=
t&#64;kms_psr&#64;psr2_sprite_mmap_cpu.html">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_5226/shard-tglb4/igt&#64;kms_psr&#64;psr2_sprite_mmap_cpu.ht=
ml</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb4/ig=
t&#64;kms_psr&#64;basic.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGT_=
5226/shard-tglb4/igt&#64;kms_psr&#64;basic.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb6/ig=
t&#64;kms_psr&#64;psr2_no_drrs.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGT_5226/shard-tglb6/igt&#64;kms_psr&#64;psr2_no_drrs.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb6/ig=
t&#64;kms_psr&#64;sprite_mmap_gtt.html">https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGT_5226/shard-tglb6/igt&#64;kms_psr&#64;sprite_mmap_gtt.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb6/ig=
t&#64;gem_media_fill.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGT_522=
6/shard-tglb6/igt&#64;gem_media_fill.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb7/ig=
t&#64;gem_render_copy&#64;y-tiled-ccs-to-linear.html">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGT_5226/shard-tglb7/igt&#64;gem_render_copy&#64;y-tile=
d-ccs-to-linear.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5226/shard-tglb7/ig=
t&#64;kms_psr&#64;sprite_render.html">https://intel-gfx-ci.01.org/tree/drm-=
tip/IGT_5226/shard-tglb7/igt&#64;kms_psr&#64;sprite_render.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3573/shard-tglb3/=
igt&#64;kms_psr&#64;basic.html">https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_3573/shard-tglb3/igt&#64;kms_psr&#64;basic.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3574/fi-tgl-u/igt=
&#64;kms_psr&#64;primary_mmap_gtt.html">https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_3574/fi-tgl-u/igt&#64;kms_psr&#64;primary_mmap_gtt.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3574/fi-tgl-u2/ig=
t&#64;kms_psr&#64;primary_mmap_gtt.html">https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_3574/fi-tgl-u2/igt&#64;kms_psr&#64;primary_mmap_gtt.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3575/fi-tgl-u/igt=
&#64;kms_psr&#64;primary_mmap_gtt.html">https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_3575/fi-tgl-u/igt&#64;kms_psr&#64;primary_mmap_gtt.html</a>
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3575/fi-tgl-u2/ig=
t&#64;kms_psr&#64;primary_mmap_gtt.html">https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_3575/fi-tgl-u2/igt&#64;kms_psr&#64;primary_mmap_gtt.html</a></=
pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15713768812.cDfe281.2511--

--===============1875424012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1875424012==--
