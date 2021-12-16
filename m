Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FC24775E4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 16:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396C610E558;
	Thu, 16 Dec 2021 15:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FD510E536;
 Thu, 16 Dec 2021 15:28:16 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 x43-20020a056830246b00b00570d09d34ebso29372500otr.2; 
 Thu, 16 Dec 2021 07:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gS5SleQFJ0ZeCZ19CqEuNxqHM/jiBtcrJM+B73uYZco=;
 b=RfTLfE0mmntxdYfW4YLQ4DZ3RxFOvDElQOc4i5Ly6DDRvFvqlQZ3jrrcoswQckN8D5
 S7DYFnLMeH0LRFhrPbi5iwErO7j6M/jhZxajK8GZFAgPRpLCt+9gcdG0ckrE+nilPgrb
 Q9EQ7n/R9+R+GeCkc+CeaQNISBDfJUMKiBK1W1rJCyKeRlx+KrQxbjgD8TtxRs0gkeP1
 N/XR7SJzSFj56mch20gUi2/RAIdwBKU8HjxWFlwYAsdwYcUYOJJdk7C6jjcy2pUgxKou
 1eEe2xBVRx8jO7d+e5QIxroSBwsAlNNOkNkTUPD4XnWRE98R0rWXSpS9AvI/ZY8Csjvd
 HG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gS5SleQFJ0ZeCZ19CqEuNxqHM/jiBtcrJM+B73uYZco=;
 b=ZjfMvr012gztEkqkBSr7rFHWP1LDts6yUWvAiegJhp2wj5zTWloO6O0fpKsaNuipzA
 DSMlPkNkTL66ztwDCoHvOR0+/dI4DpOfyv3JDdxhQD8Sogetw2oSj2kZbVg8fEdgRkRU
 iTsFrsUWQjOL6SsFjlTJ1IOLka444H/JBlqOnKUsPXxgU5geuLlmzLFD1298ZvuuC16A
 rAxz3DH6VzRUHjaojI05G8pQo5muQNz0zl9oBt/P0bPdNzRYotKfyTTV9a6v7E0Ld/Cv
 xSjb6PgUTYm3DU7w+1Yey4rbbiRygN2Ej81hwE10Bv7TwhZqEmL0T49K22DG6XFoE39v
 OL7Q==
X-Gm-Message-State: AOAM533MwJ2VadAGOBVt89qxHHZiiq22c8bG5irm509z2RA3C0k9i0LB
 3xSOK70LZoNgGbDSVG3J9r1cuH8Ij9BBPfZvLqY=
X-Google-Smtp-Source: ABdhPJy9qc2IvGAedBmdfIbQZG7Gk2bx3u3gn0K8xhiqvexwn05iOxhpZToRKObVQugYWKOitAE/KuuYhncibNaqOw8=
X-Received: by 2002:a9d:6855:: with SMTP id c21mr13182299oto.357.1639668494257; 
 Thu, 16 Dec 2021 07:28:14 -0800 (PST)
MIME-Version: 1.0
References: <10btoflyx2v-10buydfdywo@nsmail6.0>
In-Reply-To: <10btoflyx2v-10buydfdywo@nsmail6.0>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Dec 2021 10:28:03 -0500
Message-ID: <CADnq5_NEwp7LNPPLhOcH5=pGBCbFSx-EpbyrVQAr8omr0b2fmA@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFJlOiDlm57lpI06IFJlOiBbUEFUQ0hdIGRybS9hbWRncHU6IGZpeHVwIGJhZCB2cg==?=
 =?UTF-8?B?YW0gc2l6ZSBvbiBnbWMgdjg=?=
To: =?UTF-8?B?5ZGo5a6X5pWP?= <zhouzongmin@kylinos.cn>
Content-Type: multipart/alternative; boundary="00000000000026536b05d34512a1"
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000026536b05d34512a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is the issue reproducible with the same board in bare metal on x86?  Or
does it only happen with passthrough on ARM?  Looking through the archives,
the SI patch I made was for an x86 laptop.  It would be nice to root cause
this, but there weren't any gfx8 boards with more than 64G of vram, so I
think it's safe.  That said, if you see similar issues with newer gfx IPs
then we have an issue since the upper bit will be meaningful, so it would
be nice to root cause this.

Alex


On Thu, Dec 16, 2021 at 4:36 AM =E5=91=A8=E5=AE=97=E6=95=8F <zhouzongmin@ky=
linos.cn> wrote:

> Hi  Christian,
>
>
> I'm  testing for GPU passthrough feature, so I pass through this GPU to
> virtual machine to use. It  based on arm64 system.
>
> As far as i know, Alex had dealt with a similar problems on
> dri/radeon/si.c .  Maybe they have a same reason to cause it?
>
> the history commit message is below:
>
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D0ca223b029a261e82fb2f50c52eb85d510f4260e
>
> [image: image.png]
>
>
> Thanks very much.
>
>
>
> ----
>
>
>
> *=E4=B8=BB =E9=A2=98=EF=BC=9A*Re: =E5=9B=9E=E5=A4=8D: Re: [PATCH] drm/amd=
gpu: fixup bad vram size on gmc v8
>
> *=E6=97=A5 =E6=9C=9F=EF=BC=9A*2021-12-16 16:15
> *=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A*Christian K=C3=B6nig
> *=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A*=E5=91=A8=E5=AE=97=E6=95=8FAlex Deu=
cher
>
>
>
>
> Hi Zongmin,
>
>    that strongly sounds like the ASIC is not correctly initialized when
>  trying to read the register.
>
>    What board and environment are you using this GPU with? Is that a
>  normal x86 system?
>
>    Regards,
>    Christian.
>
>
>
> Am 16.12.21 um 04:11 schrieb =E5=91=A8=E5=AE=97=E6=95=8F:
>
>
>
>    1.
>
>    the problematic boards that I have tested is [AMD/ATI] Lexa
>     PRO [Radeon RX 550/550X] ;  and the vbios version :
>     113-RXF9310-C09-BT
>    2.
>
>    When an exception occurs I can see the following changes in
>     the values of vram size get from RREG32(mmCONFIG_MEMSIZE) ,
>
>    it seems to have garbage in the upper 16 bits
>
>    [image: image.png]
>
>
>
>
>    3.
>
>    and then I can also see some dmesg like below:
>
>    when vram size register have garbage,we may see error
>     message like below:
>
>    amdgpu 0000:09:00.0: VRAM: 4286582784M 0x000000F400000000 -
>     0x000FF8F4FFFFFFFF (4286582784M used)
>
>    the correct message should like below:
>
>    amdgpu 0000:09:00.0: VRAM: 4096M 0x000000F400000000 -
>     0x000000F4FFFFFFFF (4096M used)
>
>
>
>
>    if you have any problems,please send me mail.
>
>    thanks very much.
>
>
>
>
> ----
>
> *=E4=B8=BB =E9=A2=98=EF=BC=9A*Re: [PATCH] drm/amdgpu:          fixup bad =
vram size on gmc v8
>
>        *=E6=97=A5 =E6=9C=9F=EF=BC=9A*2021-12-16 04:23
>        *=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A*Alex Deucher
>        *=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A*Zongmin Zhou
>
>
>
>
> On Wed, Dec 15, 2021 at 10:31 AM Zongmin Zhouwrote:
>          >
>          > Some boards(like RX550) seem to have garbage in the upper
>          > 16 bits of the vram size register.  Check for
>          > this and clamp the size properly.  Fixes
>          > boards reporting bogus amounts of vram.
>          >
>          > after add this patch,the maximum GPU VRAM size is 64GB,
>          > otherwise only 64GB vram size will be used.
>
>          Can you provide some examples of problematic boards and
>  possibly a
>          vbios image from the problematic board?  What values are you
>      seeing?
>          It would be nice to see what the boards are reporting and
>  whether the
>          lower 16 bits are actually correct or if it is some other
>  issue.  This
>          register is undefined until the asic has been initialized.
>     The vbios
>          programs it as part of it's asic init sequence (either via
>    vesa/gop or
>          the OS driver).
>
>          Alex
>
>
>          >
>          > Signed-off-by: Zongmin Zhou
>            > ---
>            >  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c | 13
>  ++++++++++---
>            >  1 file changed, 10 insertions(+), 3 deletions(-)
>            >
>            > diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>  b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>            > index 492ebed2915b..63b890f1e8af 100644
>            > --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>            > +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>            > @@ -515,10 +515,10 @@ static void
>  gmc_v8_0_mc_program(struct amdgpu_device *adev)
>            >  static int gmc_v8_0_mc_init(struct amdgpu_device
>  *adev)
>            >  {
>            >         int r;
>            > +       u32 tmp;
>            >
>            >         adev->gmc.vram_width =3D
>  amdgpu_atombios_get_vram_width(adev);
>            >         if (!adev->gmc.vram_width) {
>            > -               u32 tmp;
>            >                 int chansize, numchan;
>            >
>            >                 /* Get VRAM informations */
>            > @@ -562,8 +562,15 @@ static int gmc_v8_0_mc_init(struct
>      amdgpu_device *adev)
>            >                 adev->gmc.vram_width =3D numchan *
>  chansize;
>            >         }
>            >         /* size in MB on si */
>            > -       adev->gmc.mc_vram_size =3D
>  RREG32(mmCONFIG_MEMSIZE) * 1024ULL * 1024ULL;
>            > -       adev->gmc.real_vram_size =3D
>  RREG32(mmCONFIG_MEMSIZE) * 1024ULL * 1024ULL;
>            > +       tmp =3D RREG32(mmCONFIG_MEMSIZE);
>            > +       /* some boards may have garbage in the upper 16
>      bits */
>            > +       if (tmp & 0xffff0000) {
>            > +               DRM_INFO("Probable bad vram size:
>  0x%08x\n", tmp);
>            > +               if (tmp & 0xffff)
>            > +                       tmp &=3D 0xffff;
>            > +       }
>            > +       adev->gmc.mc_vram_size =3D tmp * 1024ULL *
>  1024ULL;
>            > +       adev->gmc.real_vram_size =3D
>  adev->gmc.mc_vram_size;
>            >
>            >         if (!(adev->flags & AMD_IS_APU)) {
>            >                 r =3D amdgpu_device_resize_fb_bar(adev);
>            > --
>            > 2.25.1
>            >
>            >
>            > No virus found
>            >                 Checked by Hillstone Network AntiVirus
>
>
>
>
>

--00000000000026536b05d34512a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5JcyB0aGUgaXNzdWUgcmVwcm9kdWNpYmxlIHdpdGggdGhlIHNh
bWUgYm9hcmQgaW4gYmFyZSBtZXRhbCBvbiB4ODY/wqAgT3IgZG9lcyBpdCBvbmx5IGhhcHBlbiB3
aXRoIHBhc3N0aHJvdWdoIG9uIEFSTT/CoCBMb29raW5nIHRocm91Z2ggdGhlIGFyY2hpdmVzLCB0
aGUgU0kgcGF0Y2ggSSBtYWRlIHdhcyBmb3IgYW4geDg2IGxhcHRvcC7CoCA8c3BhbiBjbGFzcz0i
Z21haWwtTG0gZ21haWwtbmciPkl0PC9zcGFuPiB3b3VsZCBiZSBuaWNlIHRvIHJvb3QgY2F1c2Ug
dGhpcywgYnV0IHRoZXJlIHdlcmVuJiMzOTt0IGFueSBnZng4IGJvYXJkcyB3aXRoIG1vcmUgdGhh
biA2NEcgb2YgdnJhbSwgc28gSSB0aGluayBpdCYjMzk7cyBzYWZlLsKgIFRoYXQgc2FpZCwgaWYg
eW91IHNlZSBzaW1pbGFyIGlzc3VlcyB3aXRoIG5ld2VyIGdmeCBJUHMgdGhlbiB3ZSBoYXZlIGFu
IGlzc3VlIHNpbmNlIHRoZSB1cHBlciBiaXQgd2lsbCBiZSBtZWFuaW5nZnVsLCBzbyBpdCB3b3Vs
ZCBiZSBuaWNlIHRvIHJvb3QgY2F1c2UgdGhpcy48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5BbGV4PC9kaXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1
b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gVGh1LCBEZWMgMTYsIDIw
MjEgYXQgNDozNiBBTSDlkajlrpfmlY8gJmx0OzxhIGhyZWY9Im1haWx0bzp6aG91em9uZ21pbkBr
eWxpbm9zLmNuIiB0YXJnZXQ9Il9ibGFuayI+emhvdXpvbmdtaW5Aa3lsaW5vcy5jbjwvYT4mZ3Q7
IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJt
YXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0
LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PHA+SGnCoMKgQ2hyaXN0aWFuLDwvcD48cD48YnI+PC9w
PjxwPkkmIzM5O23CoCB0ZXN0aW5nIGZvciBHUFUgcGFzc3Rocm91Z2ggZmVhdHVyZSwgc28gSSBw
YXNzIHRocm91Z2ggdGhpcyBHUFUgdG/CoCB2aXJ0dWFsIG1hY2hpbmUgdG8gdXNlLiBJdMKgIGJh
c2VkIG9uIGFybTY0IHN5c3RlbS48L3A+PGJyPjxwPkFzIGZhciBhcyBpIGtub3csIEFsZXggaGFk
IGRlYWx0IHdpdGggYSBzaW1pbGFyIHByb2JsZW1zIG9uIGRyaS9yYWRlb24vc2kuYyAuwqAgTWF5
YmUgdGhleSBoYXZlIGEgc2FtZSByZWFzb24gdG8gY2F1c2UgaXQ/PC9wPjxwPnRoZSBoaXN0b3J5
IGNvbW1pdCBtZXNzYWdlIGlzIGJlbG93OjwvcD48cD48YSBocmVmPSJodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0
Lz9pZD0wY2EyMjNiMDI5YTI2MWU4MmZiMmY1MGM1MmViODVkNTEwZjQyNjBlIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9y
dmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9MGNhMjIzYjAyOWEyNjFlODJmYjJmNTBjNTJlYjg1
ZDUxMGY0MjYwZTwvYT48L3A+PHA+PGltZyBzcmM9Imh0dHA6Ly8vbnNtYWlsL2pzL3VlZGl0b3Iv
cGhwL3VwbG9hZC9pbWFnZS8yMDIxMTIxNi8xNjM5NjQ3MjIxMTY1MDkwLnBuZyIgdGl0bGU9IjE2
Mzk2NDcyMjExNjUwOTAucG5nIiBhbHQ9ImltYWdlLnBuZyI+PC9wPjxwPjxicj48L3A+PHA+VGhh
bmtzIHZlcnkgbXVjaC48L3A+PHA+wqAgwqA8YnI+PC9wPjxwPi0tLS08L3A+PHA+wqAgwqDCoDwv
cD48cD48c3Ryb25nPuS4u+OAgOmimO+8mjwvc3Ryb25nPjxzcGFuIGlkPSJnbWFpbC1tXzUxNTI0
NzEzMDU4MDU3NTYyNDJnbWFpbC1tXzgwNDMxMDUyNzMwODM4OTQ3MTFzdWJqZWN0Ij5SZTog5Zue
5aSNOiBSZTogW1BBVENIXSBkcm0vYW1kZ3B1OiBmaXh1cCBiYWQgdnJhbSBzaXplIG9uIGdtYyB2
ODwvc3Bhbj4NCiDCoCDCoCDCoCDCoCDCoCDCoDxicj48c3Ryb25nPuaXpeOAgOacn++8mjwvc3Ry
b25nPjxzcGFuIGlkPSJnbWFpbC1tXzUxNTI0NzEzMDU4MDU3NTYyNDJnbWFpbC1tXzgwNDMxMDUy
NzMwODM4OTQ3MTFkYXRlIj4yMDIxLTEyLTE2IDE2OjE1PC9zcGFuPg0KIMKgIMKgIMKgIMKgIMKg
IMKgPGJyPjxzdHJvbmc+5Y+R5Lu25Lq677yaPC9zdHJvbmc+PHNwYW4gaWQ9ImdtYWlsLW1fNTE1
MjQ3MTMwNTgwNTc1NjI0MmdtYWlsLW1fODA0MzEwNTI3MzA4Mzg5NDcxMWZyb20iPkNocmlzdGlh
biBLw7ZuaWc8L3NwYW4+DQogwqAgwqAgwqAgwqAgwqAgwqA8YnI+PHN0cm9uZz7mlLbku7bkurrv
vJo8L3N0cm9uZz48c3BhbiBpZD0iZ21haWwtbV81MTUyNDcxMzA1ODA1NzU2MjQyZ21haWwtbV84
MDQzMTA1MjczMDgzODk0NzExdG8iPuWRqOWul+aVj0FsZXggRGV1Y2hlcjwvc3Bhbj4NCiDCoCDC
oCDCoCDCoCDCoCDCoA0KIMKgIMKgIMKgIMKgPC9wPjxwPjxicj4NCiDCoCDCoCDCoCDCoDwvcD48
cD5IaSBab25nbWluLDxicj4NCiDCoCDCoDxicj4NCiDCoCDCoHRoYXQgc3Ryb25nbHkgc291bmRz
IGxpa2UgdGhlIEFTSUMgaXMgbm90IGNvcnJlY3RseSBpbml0aWFsaXplZCB3aGVuDQogwqAgwqB0
cnlpbmcgdG8gcmVhZCB0aGUgcmVnaXN0ZXIuPGJyPg0KIMKgIMKgPGJyPg0KIMKgIMKgV2hhdCBi
b2FyZCBhbmQgZW52aXJvbm1lbnQgYXJlIHlvdSB1c2luZyB0aGlzIEdQVSB3aXRoPyBJcyB0aGF0
IGENCiDCoCDCoG5vcm1hbCB4ODYgc3lzdGVtPzxicj4NCiDCoCDCoDxicj4NCiDCoCDCoFJlZ2Fy
ZHMsPGJyPg0KIMKgIMKgQ2hyaXN0aWFuLjxicj4NCiDCoCDCoDxicj4NCiDCoCDCoDwvcD48cD5B
bSAxNi4xMi4yMSB1bSAwNDoxMSBzY2hyaWViIOWRqOWul+aVjzo8YnI+DQogwqAgwqA8L3A+PGJs
b2NrcXVvdGUgdHlwZT0iY2l0ZSI+PG9sIHN0eWxlPSJsaXN0LXN0eWxlLXR5cGU6ZGVjaW1hbCI+
PGxpPjxwPnRoZcKgcHJvYmxlbWF0aWMgYm9hcmRzIHRoYXQgSSBoYXZlIHRlc3RlZCBpc8KgW0FN
RC9BVEldIExleGENCiDCoCDCoCDCoCDCoCDCoCDCoFBSTyBbUmFkZW9uIFJYIDU1MC81NTBYXSA7
wqAgYW5kIHRoZSB2YmlvcyB2ZXJzaW9uIDoNCiDCoCDCoCDCoCDCoCDCoCDCoDExMy1SWEY5MzEw
LUMwOS1CVDwvcD48L2xpPjxsaT48cD5XaGVuIGFuIGV4Y2VwdGlvbiBvY2N1cnMgSSBjYW4gc2Vl
IHRoZSBmb2xsb3dpbmcgY2hhbmdlcyBpbg0KIMKgIMKgIMKgIMKgIMKgIMKgdGhlIHZhbHVlcyBv
ZiB2cmFtIHNpemUgZ2V0IGZyb20gUlJFRzMyKG1tQ09ORklHX01FTVNJWkUpICw8L3A+PHA+aXQg
c2VlbXPCoHRvIGhhdmUgZ2FyYmFnZSBpbiB0aGUgdXBwZXIgMTYgYml0c8KgPC9wPjxwPjxpbWcg
c3JjPSJodHRwOi8vL25zbWFpbC9qcy91ZWRpdG9yL3BocC91cGxvYWQvaW1hZ2UvMjAyMTEyMTYv
MTYzOTYyMzY1NTY5MzY0NS5wbmciIHRpdGxlPSIxNjM5NjIzNjU1NjkzNjQ1LnBuZyIgYWx0PSJp
bWFnZS5wbmciPjxicj4NCiDCoCDCoCDCoCDCoCDCoDwvcD48cD48YnI+DQogwqAgwqAgwqAgwqAg
wqA8L3A+PC9saT48bGk+PHA+YW5kIHRoZW4gSSBjYW4gYWxzbyBzZWUgc29tZSBkbWVzZyBsaWtl
IGJlbG93OjwvcD48cD53aGVuIHZyYW0gc2l6ZSByZWdpc3RlciBoYXZlIGdhcmJhZ2Usd2UgbWF5
IHNlZSBlcnJvcg0KIMKgIMKgIMKgIMKgIMKgIMKgbWVzc2FnZSBsaWtlIGJlbG93OjwvcD48cD5h
bWRncHUgMDAwMDowOTowMC4wOiBWUkFNOiA0Mjg2NTgyNzg0TSAweDAwMDAwMEY0MDAwMDAwMDAg
LQ0KIMKgIMKgIMKgIMKgIMKgIMKgMHgwMDBGRjhGNEZGRkZGRkZGICg0Mjg2NTgyNzg0TSB1c2Vk
KTwvcD48cD50aGUgY29ycmVjdCBtZXNzYWdlIHNob3VsZCBsaWtlIGJlbG93OjwvcD48cD5hbWRn
cHUgMDAwMDowOTowMC4wOiBWUkFNOiA0MDk2TSAweDAwMDAwMEY0MDAwMDAwMDAgLQ0KIMKgIMKg
IMKgIMKgIMKgIMKgMHgwMDAwMDBGNEZGRkZGRkZGICg0MDk2TSB1c2VkKTwvcD48cD48YnI+DQog
wqAgwqAgwqAgwqAgwqA8L3A+PHA+aWYgeW91IGhhdmUgYW55IHByb2JsZW1zLHBsZWFzZSBzZW5k
IG1lIG1haWwuPC9wPjxwPnRoYW5rcyB2ZXJ5IG11Y2guPC9wPjxwPjxicj4NCiDCoCDCoCDCoCDC
oCDCoDwvcD48L2xpPjwvb2w+PHA+LS0tLcKgIMKgIMKgwqA8L3A+PHA+PHN0cm9uZz7kuLvjgIDp
opjvvJo8L3N0cm9uZz48c3BhbiBpZD0iZ21haWwtbV81MTUyNDcxMzA1ODA1NzU2MjQyZ21haWwt
bV84MDQzMTA1MjczMDgzODk0NzExc3ViamVjdCI+UmU6IFtQQVRDSF0gZHJtL2FtZGdwdToNCiDC
oCDCoCDCoCDCoCDCoGZpeHVwIGJhZCB2cmFtIHNpemUgb24gZ21jIHY4PC9zcGFuPiDCoCDCoCDC
oCDCoCDCoCDCoDxicj4NCiDCoCDCoCDCoCDCoDxzdHJvbmc+5pel44CA5pyf77yaPC9zdHJvbmc+
PHNwYW4gaWQ9ImdtYWlsLW1fNTE1MjQ3MTMwNTgwNTc1NjI0MmdtYWlsLW1fODA0MzEwNTI3MzA4
Mzg5NDcxMWRhdGUiPjIwMjEtMTItMTYgMDQ6MjM8L3NwYW4+IMKgIMKgDQogwqAgwqAgwqAgwqDC
oCDCoCDCoCDCoDxicj4NCiDCoCDCoCDCoCDCoDxzdHJvbmc+5Y+R5Lu25Lq677yaPC9zdHJvbmc+
PHNwYW4gaWQ9ImdtYWlsLW1fNTE1MjQ3MTMwNTgwNTc1NjI0MmdtYWlsLW1fODA0MzEwNTI3MzA4
Mzg5NDcxMWZyb20iPkFsZXggRGV1Y2hlcjwvc3Bhbj4gwqAgwqAgwqAgwqANCiDCoCDCoCDCoCDC
oMKgIMKgPGJyPg0KIMKgIMKgIMKgIMKgPHN0cm9uZz7mlLbku7bkurrvvJo8L3N0cm9uZz48c3Bh
biBpZD0iZ21haWwtbV81MTUyNDcxMzA1ODA1NzU2MjQyZ21haWwtbV84MDQzMTA1MjczMDgzODk0
NzExdG8iPlpvbmdtaW4gWmhvdTwvc3Bhbj4gwqAgwqAgwqAgwqAgwqANCiDCoCDCoCDCoCDCoMKg
IMKgIMKgIMKgIMKgPC9wPjxwPjxicj4NCiDCoCDCoCDCoCDCoMKgIMKgIMKgIMKgPC9wPjxwPk9u
IFdlZCwgRGVjIDE1LCAyMDIxIGF0IDEwOjMxIEFNIFpvbmdtaW4gWmhvdTx1PjwvdT53cm90ZTo8
YnI+DQogwqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KIMKgIMKgIMKgIMKgIMKgJmd0OyBTb21lIGJv
YXJkcyhsaWtlIFJYNTUwKSBzZWVtIHRvIGhhdmUgZ2FyYmFnZSBpbiB0aGUgdXBwZXI8YnI+DQog
wqAgwqAgwqAgwqAgwqAmZ3Q7IDE2IGJpdHMgb2YgdGhlIHZyYW0gc2l6ZSByZWdpc3Rlci7CoCBD
aGVjayBmb3I8YnI+DQogwqAgwqAgwqAgwqAgwqAmZ3Q7IHRoaXMgYW5kIGNsYW1wIHRoZSBzaXpl
IHByb3Blcmx5LsKgIEZpeGVzPGJyPg0KIMKgIMKgIMKgIMKgIMKgJmd0OyBib2FyZHMgcmVwb3J0
aW5nIGJvZ3VzIGFtb3VudHMgb2YgdnJhbS48YnI+DQogwqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0K
IMKgIMKgIMKgIMKgIMKgJmd0OyBhZnRlciBhZGQgdGhpcyBwYXRjaCx0aGUgbWF4aW11bSBHUFUg
VlJBTSBzaXplIGlzIDY0R0IsPGJyPg0KIMKgIMKgIMKgIMKgIMKgJmd0OyBvdGhlcndpc2Ugb25s
eSA2NEdCIHZyYW0gc2l6ZSB3aWxsIGJlIHVzZWQuPGJyPg0KIMKgIMKgIMKgIMKgIMKgPGJyPg0K
IMKgIMKgIMKgIMKgIMKgQ2FuIHlvdSBwcm92aWRlIHNvbWUgZXhhbXBsZXMgb2YgcHJvYmxlbWF0
aWMgYm9hcmRzIGFuZA0KIMKgIMKgIMKgIMKgIMKgcG9zc2libHkgYTxicj4NCiDCoCDCoCDCoCDC
oCDCoHZiaW9zIGltYWdlIGZyb20gdGhlIHByb2JsZW1hdGljIGJvYXJkP8KgIFdoYXQgdmFsdWVz
IGFyZSB5b3UNCiDCoCDCoCDCoCDCoCDCoHNlZWluZz88YnI+DQogwqAgwqAgwqAgwqAgwqBJdCB3
b3VsZCBiZSBuaWNlIHRvIHNlZSB3aGF0IHRoZSBib2FyZHMgYXJlIHJlcG9ydGluZyBhbmQNCiDC
oCDCoCDCoCDCoCDCoHdoZXRoZXIgdGhlPGJyPg0KIMKgIMKgIMKgIMKgIMKgbG93ZXIgMTYgYml0
cyBhcmUgYWN0dWFsbHkgY29ycmVjdCBvciBpZiBpdCBpcyBzb21lIG90aGVyDQogwqAgwqAgwqAg
wqAgwqBpc3N1ZS7CoCBUaGlzPGJyPg0KIMKgIMKgIMKgIMKgIMKgcmVnaXN0ZXIgaXMgdW5kZWZp
bmVkIHVudGlsIHRoZSBhc2ljIGhhcyBiZWVuIGluaXRpYWxpemVkLg0KIMKgIMKgIMKgIMKgIMKg
wqBUaGUgdmJpb3M8YnI+DQogwqAgwqAgwqAgwqAgwqBwcm9ncmFtcyBpdCBhcyBwYXJ0IG9mIGl0
JiMzOTtzIGFzaWMgaW5pdCBzZXF1ZW5jZSAoZWl0aGVyIHZpYQ0KIMKgIMKgIMKgIMKgIMKgdmVz
YS9nb3Agb3I8YnI+DQogwqAgwqAgwqAgwqAgwqB0aGUgT1MgZHJpdmVyKS48YnI+DQogwqAgwqAg
wqAgwqAgwqA8YnI+DQogwqAgwqAgwqAgwqAgwqBBbGV4PGJyPg0KIMKgIMKgIMKgIMKgIMKgPGJy
Pg0KIMKgIMKgIMKgIMKgIMKgPGJyPg0KIMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiDCoCDCoCDC
oCDCoCDCoCZndDsgU2lnbmVkLW9mZi1ieTogWm9uZ21pbiBaaG91PHU+PC91Pjxicj4NCiDCoCDC
oCDCoCDCoCDCoCDCoCZndDsgLS0tPGJyPg0KIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyDCoGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OF8wLmMgfCAxMw0KIMKgIMKgIMKgIMKgIMKgIMKg
KysrKysrKysrKy0tLTxicj4NCiDCoCDCoCDCoCDCoCDCoCDCoCZndDsgwqAxIGZpbGUgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSk8YnI+DQogwqAgwqAgwqAgwqAgwqAg
wqAmZ3Q7PGJyPg0KIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y4XzAuYw0KIMKgIMKgIMKgIMKgIMKgIMKgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjhfMC5jPGJyPg0KIMKgIMKgIMKgIMKgIMKgIMKgJmd0
OyBpbmRleCA0OTJlYmVkMjkxNWIuLjYzYjg5MGYxZThhZiAxMDA2NDQ8YnI+DQogwqAgwqAgwqAg
wqAgwqAgwqAmZ3Q7IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OF8wLmM8
YnI+DQogwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dtY192OF8wLmM8YnI+DQogwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IEBAIC01MTUsMTAgKzUx
NSwxMCBAQCBzdGF0aWMgdm9pZA0KIMKgIMKgIMKgIMKgIMKgIMKgZ21jX3Y4XzBfbWNfcHJvZ3Jh
bShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik8YnI+DQogwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7
IMKgc3RhdGljIGludCBnbWNfdjhfMF9tY19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlDQogwqAg
wqAgwqAgwqAgwqAgwqAqYWRldik8YnI+DQogwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IMKgezxicj4N
CiDCoCDCoCDCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqAgaW50IHI7PGJyPg0KIMKgIMKgIMKg
IMKgIMKgIMKgJmd0OyArIMKgIMKgIMKgIHUzMiB0bXA7PGJyPg0KIMKgIMKgIMKgIMKgIMKgIMKg
Jmd0Ozxicj4NCiDCoCDCoCDCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqAgYWRldi0mZ3Q7Z21j
LnZyYW1fd2lkdGggPQ0KIMKgIMKgIMKgIMKgIMKgIMKgYW1kZ3B1X2F0b21iaW9zX2dldF92cmFt
X3dpZHRoKGFkZXYpOzxicj4NCiDCoCDCoCDCoCDCoCDCoCDCoCZndDsgwqAgwqAgwqAgwqAgaWYg
KCFhZGV2LSZndDtnbWMudnJhbV93aWR0aCkgezxicj4NCiDCoCDCoCDCoCDCoCDCoCDCoCZndDsg
LSDCoCDCoCDCoCDCoCDCoCDCoCDCoCB1MzIgdG1wOzxicj4NCiDCoCDCoCDCoCDCoCDCoCDCoCZn
dDsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW50IGNoYW5zaXplLCBudW1jaGFuOzxicj4NCiDC
oCDCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQogwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIC8qIEdldCBWUkFNIGluZm9ybWF0aW9ucyAqLzxicj4NCiDCoCDCoCDC
oCDCoCDCoCDCoCZndDsgQEAgLTU2Miw4ICs1NjIsMTUgQEAgc3RhdGljIGludCBnbWNfdjhfMF9t
Y19pbml0KHN0cnVjdA0KIMKgIMKgIMKgIMKgIMKgIMKgYW1kZ3B1X2RldmljZSAqYWRldik8YnI+
DQogwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFkZXYtJmd0
O2dtYy52cmFtX3dpZHRoID0gbnVtY2hhbiAqDQogwqAgwqAgwqAgwqAgwqAgwqBjaGFuc2l6ZTs8
YnI+DQogwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgIH08YnI+DQogwqAgwqAgwqAg
wqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgIC8qIHNpemUgaW4gTUIgb24gc2kgKi88YnI+DQogwqAg
wqAgwqAgwqAgwqAgwqAmZ3Q7IC0gwqAgwqAgwqAgYWRldi0mZ3Q7Z21jLm1jX3ZyYW1fc2l6ZSA9
DQogwqAgwqAgwqAgwqAgwqAgwqBSUkVHMzIobW1DT05GSUdfTUVNU0laRSkgKiAxMDI0VUxMICog
MTAyNFVMTDs8YnI+DQogwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC0gwqAgwqAgwqAgYWRldi0mZ3Q7
Z21jLnJlYWxfdnJhbV9zaXplID0NCiDCoCDCoCDCoCDCoCDCoCDCoFJSRUczMihtbUNPTkZJR19N
RU1TSVpFKSAqIDEwMjRVTEwgKiAxMDI0VUxMOzxicj4NCiDCoCDCoCDCoCDCoCDCoCDCoCZndDsg
KyDCoCDCoCDCoCB0bXAgPSBSUkVHMzIobW1DT05GSUdfTUVNU0laRSk7PGJyPg0KIMKgIMKgIMKg
IMKgIMKgIMKgJmd0OyArIMKgIMKgIMKgIC8qIHNvbWUgYm9hcmRzIG1heSBoYXZlIGdhcmJhZ2Ug
aW4gdGhlIHVwcGVyIDE2DQogwqAgwqAgwqAgwqAgwqAgwqBiaXRzICovPGJyPg0KIMKgIMKgIMKg
IMKgIMKgIMKgJmd0OyArIMKgIMKgIMKgIGlmICh0bXAgJmFtcDsgMHhmZmZmMDAwMCkgezxicj4N
CiDCoCDCoCDCoCDCoCDCoCDCoCZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCBEUk1fSU5GTygm
cXVvdDtQcm9iYWJsZSBiYWQgdnJhbSBzaXplOg0KIMKgIMKgIMKgIMKgIMKgIMKgMHglMDh4XG4m
cXVvdDssIHRtcCk7PGJyPg0KIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyArIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGlmICh0bXAgJmFtcDsgMHhmZmZmKTxicj4NCiDCoCDCoCDCoCDCoCDCoCDCoCZndDsg
KyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0bXAgJmFtcDs9IDB4ZmZmZjs8YnI+
DQogwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7ICsgwqAgwqAgwqAgfTxicj4NCiDCoCDCoCDCoCDCoCDC
oCDCoCZndDsgKyDCoCDCoCDCoCBhZGV2LSZndDtnbWMubWNfdnJhbV9zaXplID0gdG1wICogMTAy
NFVMTCAqDQogwqAgwqAgwqAgwqAgwqAgwqAxMDI0VUxMOzxicj4NCiDCoCDCoCDCoCDCoCDCoCDC
oCZndDsgKyDCoCDCoCDCoCBhZGV2LSZndDtnbWMucmVhbF92cmFtX3NpemUgPQ0KIMKgIMKgIMKg
IMKgIMKgIMKgYWRldi0mZ3Q7Z21jLm1jX3ZyYW1fc2l6ZTs8YnI+DQogwqAgwqAgwqAgwqAgwqAg
wqAmZ3Q7PGJyPg0KIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyDCoCDCoCDCoCDCoCBpZiAoIShhZGV2
LSZndDtmbGFncyAmYW1wOyBBTURfSVNfQVBVKSkgezxicj4NCiDCoCDCoCDCoCDCoCDCoCDCoCZn
dDsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgciA9IGFtZGdwdV9kZXZpY2VfcmVzaXplX2ZiX2Jh
cihhZGV2KTs8YnI+DQogwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC0tPGJyPg0KIMKgIMKgIMKgIMKg
IMKgIMKgJmd0OyAyLjI1LjE8YnI+DQogwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KIMKgIMKg
IMKgIMKgIMKgIMKgJmd0Ozxicj4NCiDCoCDCoCDCoCDCoCDCoCDCoCZndDsgTm8gdmlydXMgZm91
bmQ8YnI+DQogwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIENo
ZWNrZWQgYnkgSGlsbHN0b25lIE5ldHdvcmsgQW50aVZpcnVzPGJyPg0KIMKgIMKgIMKgIMKgIMKg
PHU+PC91Pjx1PjwvdT48L3A+PC9ibG9ja3F1b3RlPjxwPjxicj4NCiDCoDwvcD48L2Jsb2NrcXVv
dGU+PC9kaXY+DQo=
--00000000000026536b05d34512a1--
